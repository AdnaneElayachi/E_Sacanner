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

# import os
# from django.views import View
# from django.shortcuts import render
# from django.http import JsonResponse
# from .scanner_ocr import reconnaissance_ID
# from .models import ResultatOCR
# from .serializers import ResultatOCRSerializer

# class OCRView(View):

#     template_name = 'index.html' 

#     def get(self, request):
#         return render(request, self.template_name)

#     def post(self, request):
#         image_file = request.FILES.get('image_file')

#         if image_file:
#             try:
#                 upload_folder = 'chemin/vers/dossier/upload/'
#                 chemin_image = os.path.join(upload_folder, image_file.name)

#                 with open(chemin_image, 'wb') as destination:
#                     for chunk in image_file.chunks():
#                         destination.write(chunk)

#                 resultat_df = reconnaissance_ID(chemin_image)

#                 serializer = ResultatOCRSerializer(data=resultat_df.to_dict(orient='records'), many=True)
#                 if serializer.is_valid():
#                     serializer.save()

#                 return JsonResponse({'resultat': resultat_df.to_dict(orient='records')})

#             except Exception as e:
#                 return JsonResponse({'error': str(e)})

#         return JsonResponse({'error': 'Aucun fichier image n\'a été fourni.'})

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
        return render(request, self.template_name)

    def post(self, request):
        image_file = request.FILES.get('image_file')

        if image_file:
            try:
                upload_folder = 'chemin/vers/dossier/upload/'
                chemin_image = os.path.join(upload_folder, image_file.name)

                with open(chemin_image, 'wb') as destination:
                    for chunk in image_file.chunks():
                        destination.write(chunk)

                texte = reconnaissance_ID(chemin_image)

                context = {'texte': texte}
                return render(request, self.template_name, context)

            except Exception as e:
                return JsonResponse({'error': str(e)})

        return JsonResponse({'error': 'Aucun fichier image n\'a été fourni.'})

# class OCRView(View):

#     template_name = 'index.html' 
#     upload_folder = 'chemin/vers/dossier/upload/'

#     def get(self, request):
#         return render(request, self.template_name)

#     def post(self, request):
#         image_file = request.FILES.get('image_file')

#         if image_file:
#             try:
#                 chemin_image = os.path.join(self.upload_folder, image_file.name)

#                 with open(chemin_image, 'wb') as destination:
#                     for chunk in image_file.chunks():
#                         destination.write(chunk)

#                 texte = reconnaissance_ID(chemin_image)
#                 chemin_texte = os.path.join(self.upload_folder, 'resultat.txt')

#                 with open(chemin_texte, 'w') as fichier_texte:
#                     fichier_texte.write(texte)

#                 context = {'texte': texte}
#                 return render(request, self.template_name, context)

#             except Exception as e:
#                 return JsonResponse({'error': str(e)})

#         return JsonResponse({'error': 'Aucun fichier image n\'a été fourni.'})


from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .scanner_ocr import reconnaissance_ID
from .models import ResultatOCR
from rest_framework.parsers import MultiPartParser
from .serializers import ResultatOCRSerializer


# class OCRAPIView(APIView):
#     parser_classes = [MultiPartParser]
#     template_name = 'index.html'
#     def get(self, request, format=None):      
#         return render(request, self.template_name)
#     def post(self, request, format=None):  
         
#         image_file = request.FILES.get('image_file')
#         if image_file:
#             try:              
#                 upload_folder = 'chemin/vers/dossier/upload/'
#                 chemin_image = os.path.join(upload_folder, image_file.name)
#                 with open(chemin_image, 'wb') as destination:
#                     for chunk in image_file.chunks():
#                         destination.write(chunk)             
#                 resultat_df = reconnaissance_ID(chemin_image)              
#                 serializer = ResultatOCRSerializer(data=resultat_df.to_dict(orient='records'), many=True)
#                 if serializer.is_valid():
#                     serializer.save()
#                 return Response({'resultat': resultat_df.to_dict(orient='records')}, status=status.HTTP_200_OK)
#             except Exception as e:
#                 return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
#         return Response({'error': 'Aucun fichier image n\'a été fourni.'}, status=status.HTTP_400_BAD_REQUEST)





# class OCRAPIView(APIView):
#     parser_classes = [MultiPartParser]
#     template_name = 'index.html'

#     def get(self, request, format=None):
#         return render(request, self.template_name)

#     def post(self, request, format=None):
#         image_file = request.FILES.get('image_file')
#         if image_file:
#             try:
#                 upload_folder = 'chemin/vers/dossier/upload/'
#                 chemin_image = os.path.join(upload_folder, image_file.name)

#                 with open(chemin_image, 'wb') as destination:
#                     for chunk in image_file.chunks():
#                         destination.write(chunk)

#                 resultat_df = reconnaissance_ID(chemin_image)

#                 # Extract essential information (modify as per your OCR output structure)
#                 name = resultat_df[resultat_df['Champ'] == 'NOM']['Valeur'].iloc[0]
#                 date_of_birth = resultat_df[resultat_df['Champ'] == 'Néle']['Valeur'].iloc[0]

#                 # Save to ResultatOCR model
#                 ResultatOCR.objects.create(name=name, date_of_birth=date_of_birth)

#                 serializer = ResultatOCRSerializer(data=resultat_df.to_dict(orient='records'), many=True)
#                 if serializer.is_valid():
#                     serializer.save()

#                 return Response({'resultat': resultat_df.to_dict(orient='records')}, status=status.HTTP_200_OK)
#             except Exception as e:
#                 return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
#         return Response({'error': 'Aucun fichier image n\'a été fourni.'}, status=status.HTTP_400_BAD_REQUEST)


from django.http import JsonResponse
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from django.shortcuts import render
import os

@method_decorator(csrf_exempt, name='dispatch')
class OCRViewAPI(View):

   

    def get(self, request):
        return render(request)

    def post(self, request):
        return self.process_image(request)

    def process_image(self, request):
        image_file = request.FILES.get('image_file')

        if image_file:
            try:
                upload_folder = 'chemin/vers/dossier/upload/'
                chemin_image = os.path.join(upload_folder, image_file.name)

                with open(chemin_image, 'wb') as destination:
                    for chunk in image_file.chunks():
                        destination.write(chunk)

                texte = reconnaissance_ID(chemin_image)

                context = {'texte': texte}
                return JsonResponse(context)

            except Exception as e:
                return JsonResponse({'error': str(e)})

        return JsonResponse({'error': 'Aucun fichier image n\'a été fourni.'})
    



from django.shortcuts import render
from django.http import HttpResponse
from .serializers import ResultatOCRSerializer
from .models import ResultatOCR
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.response import Response
from rest_framework import status
import os,glob

class PostView(APIView):
    parser_classes = (MultiPartParser, FormParser)
    
    def get(self, request, *args, **kwargs):
        
        text_data=''
        date_info=''
        fn=''

        path=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        for filename in os.listdir(path):
            fn=os.path.join(path, filename)
            text_data,date_info=reconnaissance_ID(fn)
        
        data={}
        data["imageText"]=text_data
        data["dateInfo"]=date_info

        posts = ResultatOCR.objects.all()
        posts.delete()
        
        path=path+"*"
        list_of_f=glob.glob(path)
        for i in list_of_f:
            os.remove(i)
      
        return Response(data,status=status.HTTP_200_OK)

       
    def post(self, request, *args, **kwargs):
        posts_serializer = ResultatOCRSerializer(data=request.data)
        print(request.data['image'])
        if posts_serializer.is_valid():
            posts_serializer.save()
            return Response(posts_serializer.data, status=status.HTTP_201_CREATED)
        else:
            print('error', posts_serializer.errors)
            return Response(posts_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
