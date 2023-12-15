from django.contrib.auth import authenticate, login as auth_login
from django.core.mail import send_mail
from django.shortcuts import redirect, render
from django.conf import settings
from .models import CustomUser
import cv2
import pytesseract
def Login(request):
    if request.method == "POST":
        email_login = request.POST.get('email_login')        
        password_login = request.POST.get('password_login')
        user = authenticate(request, username=email_login, password=password_login)
        
        if user is not None:
            if user.compteActive:
                user_department = user.departement
                request.session['user_department'] = user_department.pk

                auth_login(request, user)
                return redirect('accueil')  # Remplacez 'accueil' par le nom de votre vue d'accueil
            else:
                return render(request, 'CompteDesactiver.html')
        else:
            erreur = "Authentification non valide"  
            return render(request, 'singin.html', {'erreur': erreur})
    
    return render(request, 'singin.html')

def Register(request):
    if request.method == "POST":
        nom_registre = request.POST.get('Nom_registre')
        prenom_registre = request.POST.get('Prenom_registre')
        email_registre = request.POST.get('email_registre')
        mdp_registre = request.POST.get('mdp_registre')
        mdp_registre_confirm = request.POST.get('mdp_registre_confirm')

        if mdp_registre != mdp_registre_confirm:
            erreur = "Les mots de passe ne correspondent pas"
            return render(request, 'singup.html', {'erreur': erreur})

        try:
            user = CustomUser.objects.create_user(
                email=email_registre,
                password=mdp_registre,
                first_name=prenom_registre,
                last_name=nom_registre,
            )

            user.save()
            
            subject = 'Bienvenue sur notre plateforme'
            message = f'Bonjour {user.first_name} {user.last_name}, Merci pour votre inscription. Attendez la confirmation de votre compte.'
            email_from = settings.EMAIL_HOST_USER
            recipient_list = [user.email]

            send_mail(subject, message, email_from, recipient_list)
            
            return redirect('Login')

        except Exception as e:
            print('Erreur inconnue:', e)
            erreur = "Une erreur est survenue lors de l'inscription"
            return render(request, 'singup.html', {'erreur': erreur})

    return render(request, 'singup.html')


##############################
def inputImage(Images):
    return Images.imread(Images)

def ocr_core(img):
    text = pytesseract.image_to_string(img)
    return text

def get_grayscale(image):
    return cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)

def remove_noise(image):
    return cv2.medianBlur(image,5)

def thresholding(image):
    return cv2.threshold(image,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)[1]

inputImage=get_grayscale(inputImage)
inputImage=thresholding(inputImage)
inputImage=remove_noise(inputImage)

