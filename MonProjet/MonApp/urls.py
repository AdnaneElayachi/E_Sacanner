from django.urls import path
from .views import  OCRView, OCRAPIView

urlpatterns = [
    path('ocr/', OCRView.as_view(), name='ocr_view'),
    
    path('ocrapi/', OCRAPIView.as_view(), name='ocr_view'),

]
