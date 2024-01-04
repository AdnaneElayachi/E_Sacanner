from django.urls import path

from .views import  getData, ocr_view

urlpatterns = [
    path('ocr/', ocr_view, name='ocr_view'),
    path('api/data/', getData, name='get_data'),
]
