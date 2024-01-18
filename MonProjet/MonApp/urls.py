from django.urls import path
from .views import  OCRView, OCRViewAPI

urlpatterns = [
    path('ocr/', OCRView.as_view(), name='ocr_view'),
    
    
path('PostView/', OCRViewAPI.as_view(), name='PostView'),
]
