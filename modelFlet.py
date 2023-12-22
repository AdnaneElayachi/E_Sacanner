import re
import pytesseract
from PIL import Image as img
from flet import Page, TextField, ElevatedButton, Column, Image

def processyourimage(page: Page):
    image_path = page.get_value("./OIP.jpg")
    
    try:
        # Charger l'image
        print("**1")
        image = img.open(image_path)
        
        # Utiliser pytesseract pour extraire le texte de l'image
        text = pytesseract.image_to_string(image)
        
        # Extraire des informations spécifiques à l'aide d'expressions régulières
        cin_match = re.search(r'\b\d{8}\b', text)
        name_match = re.search(r'\b[A-Za-z]+\b', text)
        last_name_match = re.search(r'\b[A-Za-z]+\b', text)
        place_birth_match = re.search(r'\b[A-Za-z]+\b', text)
        birth_day_match = re.search(r'\b\d{2}/\d{2}/\d{4}\b', text)
        print("**2")
        # Afficher les informations extraites
        page.show_alert(f"CIN: {cin_match.group()}")
        page.show_alert(f"Nom: {name_match.group()}")
        page.show_alert(f"Prenom: {last_name_match.group()}")
        page.show_alert(f"Lieu de naissance: {place_birth_match.group()}")
        page.show_alert(f"Date de naissance: {birth_day_match.group()}")
        
    except Exception as e:
        page.show_alert(f"Une erreur s'est produite: {str(e)}")


def main(page: Page):
    page.scroll = "auto"
   
    image_loc = TextField(label="Nom de votre image", name="image_loc")
    
    page.add(
        Column([
            image_loc,
            ElevatedButton("Traitement de l'image",
                           bgcolor="white", color="white",
                           on_click=processyourimage),
        ])
    )

print("3")
# Initialiser l'application Flet
flet.app(target=main)
