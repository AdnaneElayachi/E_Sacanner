from django.urls import path
from .views import  OCRView, PostView

urlpatterns = [
    path('ocr/', OCRView.as_view(), name='ocr_view'),
    
    
path('PostView/', PostView.as_view(), name='PostView'),
]
