from django.urls import path

from MonApp.graphql_views import GraphQLView
from .views import  ocr_view

urlpatterns = [
    path('ocr/', ocr_view, name='ocr_view'),
    path('graphql/', GraphQLView.as_view(graphiql=True)),
]
