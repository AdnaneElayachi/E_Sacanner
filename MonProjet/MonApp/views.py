import os
from django.conf import settings
from django.http import JsonResponse
from django.shortcuts import render

from .scanner_ocr import reconnaissance_ID 
from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import ResultatOCR
from .serializers import ResultatOCRSerializer
class ResultatOCRList(APIView):
    def get(self, request):
        articles = ResultatOCR.objects.all()
        serializer = ResultatOCRSerializer(articles, many=True)
        return Response(serializer.data)

    def post(self, request):
        image_file = request.FILES['image_file']

        upload_folder = os.path.join(settings.BASE_DIR, 'chemin/vers/dossier/upload/')

        if not os.path.exists(upload_folder):
            os.makedirs(upload_folder)

        chemin_image = os.path.join(upload_folder, image_file.name)

        with open(chemin_image, 'wb') as destination:
            for chunk in image_file.chunks():
                destination.write(chunk)

        resultat_df = reconnaissance_ID(chemin_image)

        serializer = ResultatOCRSerializer(data=resultat_df.to_dict(orient='records'), many=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


def ocr_view(request):
    if request.method == 'POST':
        image_file = request.FILES['image_file']

        upload_folder = os.path.join(settings.BASE_DIR, 'chemin/vers/dossier/upload/')

        if not os.path.exists(upload_folder):
            os.makedirs(upload_folder)

        chemin_image = os.path.join(upload_folder, image_file.name)

        with open(chemin_image, 'wb') as destination:
            for chunk in image_file.chunks():
                destination.write(chunk)

        resultat_df = reconnaissance_ID(chemin_image)

        return JsonResponse({'resultat': resultat_df.to_dict(orient='records')})

    return render(request, 'index.html')


############################################################################################################




