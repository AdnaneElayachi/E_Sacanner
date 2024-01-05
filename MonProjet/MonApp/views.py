# import os
# from django.conf import settings
# from django.http import JsonResponse
# from django.shortcuts import render

# from .scanner_ocr import reconnaissance_ID 
# from django.shortcuts import get_object_or_404
# from rest_framework.views import APIView
# from rest_framework.response import Response
# from rest_framework import status
# from .models import ResultatOCR
# from .serializers import ResultatOCRSerializer
# class ResultatOCRList(APIView):

#     def get(self, request):
#         resultatOCR = ResultatOCR.objects.all()
#         serializer = ResultatOCRSerializer(resultatOCR, many=True)
#         return Response(serializer.data)

#     def post(self, request):
#         image_file = request.FILES['image_file']

#         upload_folder = os.path.join(settings.BASE_DIR, 'chemin/vers/dossier/upload/')

#         if not os.path.exists(upload_folder):
#             os.makedirs(upload_folder)

#         chemin_image = os.path.join(upload_folder, image_file.name)

#         with open(chemin_image, 'wb') as destination:
#             for chunk in image_file.chunks():
#                 destination.write(chunk)

#         resultat_df = reconnaissance_ID(chemin_image)

#         serializer = ResultatOCRSerializer(data=resultat_df.to_dict(orient='records'), many=True)
#         if serializer.is_valid():
#             serializer.save()
#             return Response(serializer.data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# def ocr_view(request):
#     if request.method == 'POST':
#         image_file = request.FILES['image_file']

#         upload_folder = os.path.join(settings.BASE_DIR, 'chemin/vers/dossier/upload/')

#         if not os.path.exists(upload_folder):
#             os.makedirs(upload_folder)

#         chemin_image = os.path.join(upload_folder, image_file.name)

#         with open(chemin_image, 'wb') as destination:
#             for chunk in image_file.chunks():
#                 destination.write(chunk)

#         resultat_df = reconnaissance_ID(chemin_image)

#         return JsonResponse({'resultat': resultat_df.to_dict(orient='records')})

#     return render(request, 'index.html')


# ############################################################################################################

import os
from django.views import View
from django.shortcuts import render
from django.http import JsonResponse
from .scanner_ocr import reconnaissance_ID
from .models import ResultatOCR
from .serializers import ResultatOCRSerializer

class OCRView(View):
    template_name = 'index.html'

    def get(self, request):
        # Affiche le formulaire lorsqu'il est accédé via GET
        return render(request, self.template_name)

    def post(self, request):
        # Traite l'image OCR lorsqu'il est accédé via POST
        image_file = request.FILES.get('image_file')

        if image_file:
            try:
                # Enregistrez le fichier image et obtenez le chemin d'accès
                upload_folder = 'chemin/vers/dossier/upload/'
                chemin_image = os.path.join(upload_folder, image_file.name)

                with open(chemin_image, 'wb') as destination:
                    for chunk in image_file.chunks():
                        destination.write(chunk)

                # Effectuez le traitement OCR
                resultat_df = reconnaissance_ID(chemin_image)

                # Sauvegardez les résultats dans la base de données (ajustez selon vos besoins)
                serializer = ResultatOCRSerializer(data=resultat_df.to_dict(orient='records'), many=True)
                if serializer.is_valid():
                    serializer.save()

                return JsonResponse({'resultat': resultat_df.to_dict(orient='records')})

            except Exception as e:
                return JsonResponse({'error': str(e)})

        return JsonResponse({'error': 'Aucun fichier image n\'a été fourni.'})

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .scanner_ocr import reconnaissance_ID
from .models import ResultatOCR
from .serializers import ResultatOCRSerializer
class OCRAPIView(APIView):
    def get(self, request, format=None):
        # Logique pour gérer les requêtes GET
        return Response({'message': 'Utilisez une requête POST pour effectuer l\'OCR.'})

    def post(self, request, format=None):
        # Logique pour gérer les requêtes POST
        image_file = request.FILES.get('image_file')

        if image_file:
            try:
                # Enregistrez le fichier image et obtenez le chemin d'accès
                upload_folder = 'chemin/vers/dossier/upload/'
                chemin_image = os.path.join(upload_folder, image_file.name)

                with open(chemin_image, 'wb') as destination:
                    for chunk in image_file.chunks():
                        destination.write(chunk)

                # Effectuez le traitement OCR
                resultat_df = reconnaissance_ID(chemin_image)

                # Sauvegardez les résultats dans la base de données (ajustez selon vos besoins)
                serializer = ResultatOCRSerializer(data=resultat_df.to_dict(orient='records'), many=True)
                if serializer.is_valid():
                    serializer.save()

                return Response({'resultat': resultat_df.to_dict(orient='records')}, status=status.HTTP_200_OK)

            except Exception as e:
                return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return Response({'error': 'Aucun fichier image n\'a été fourni.'}, status=status.HTTP_400_BAD_REQUEST)
