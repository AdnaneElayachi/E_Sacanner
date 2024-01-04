from django.urls import path

from .views import  ResultatOCRList, ocr_view

urlpatterns = [
    path('ocr/', ocr_view, name='ocr_view'),
    path('api/', ResultatOCRList.as_view(), name='api'),
  
]
