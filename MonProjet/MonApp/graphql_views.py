# graphql_views.py
import os
import graphene
from graphene_file_upload.scalars import Upload
from django.http import HttpResponse, JsonResponse
from graphql import ExecutionResult, execute, parse, validate, get_operation_ast
from django.db import transaction
from django.conf import settings
from MonApp.models import ResultatOCR
from MonApp.scanner_ocr import reconnaissance_ID
from graphene_django.utils.utils import set_rollback
from django.views import View

class GraphQLView(View):
    graphiql = False  # Set the default value for graphiql

    def execute_graphql_request(
        self, request, data, query, variables, operation_name, show_graphiql=None
    ):
        try:
            operation_ast = get_operation_ast(data)  # Add this line to define operation_ast

            # Check if 'show_graphiql' is provided in the URL or set to True in the configuration
            if show_graphiql is None:
                show_graphiql = self.graphiql

            if show_graphiql:
                # Customize behavior based on the 'graphiql' parameter
                return self.render_graphiql(request, data, query, variables, operation_name)

            if operation_name == "ocr_process":
                mutation = OCRMutation.Field()
                result = mutation.mutate(None, None, **variables)
                response_data = {"data": {"ocr_process": result.data}, "errors": result.errors}
                return ExecutionResult(data=response_data, errors=None)

            schema = None  # Replace with your actual schema
            document = parse(query)  # Define document

            execute_options = {
                "root_value": self.get_root_value(request),
                "context_value": self.get_context(request),
                "variable_values": variables,
                "operation_name": operation_name,
                "middleware": self.get_middleware(request),
            }
            if self.execution_context_class:
                execute_options["execution_context_class"] = self.execution_context_class

            if (
                operation_ast is not None
                and operation_ast.operation == graphene.OperationType.MUTATION
                and (
                    settings.ATOMIC_MUTATIONS is True
                    or settings.connection.settings_dict.get("ATOMIC_MUTATIONS", False) is True
                )
            ):
                with transaction.atomic():
                    result = execute(schema, document, **execute_options)
                    if getattr(request, 'MUTATION_ERRORS_FLAG', False) is True:
                        transaction.set_rollback(True)
                return result

            return execute(schema, document, **execute_options)
        except Exception as e:
            return ExecutionResult(errors=[e])

    def render_graphiql(self, request, data, query, variables, operation_name):
        # Implement your custom GraphiQL rendering logic here
        # You can use a template or any other method to render the GraphiQL interface
        # For simplicity, you can return a HttpResponse with a basic HTML containing GraphiQL
        return HttpResponse("Custom GraphiQL Rendering")
