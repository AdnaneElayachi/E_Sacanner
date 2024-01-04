import graphene
from graphene_django import DjangoObjectType
from .models import MyModel, ResultatOCR

class ResultatOCRType(DjangoObjectType):
    class Meta:
        model = ResultatOCR

class Query(graphene.ObjectType):
    resultat_ocr = graphene.List(ResultatOCRType)

    def resolve_resultat_ocr(self, info, **kwargs):
        return ResultatOCR.objects.all()

schema = graphene.Schema(query=Query)
