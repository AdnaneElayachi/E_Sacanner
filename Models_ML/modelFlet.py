import cv2
import pytesseract
import easyocr
import numpy as np  # Ajoutez cette ligne pour importer NumPy
from PIL import Image

def process_your_image(image_path):
    try:
        # Charger l'image
        print("**1")
        image = Image.open(image_path)

        # Convertir l'image en tableau NumPy pour une utilisation avec OpenCV
        image_np = cv2.cvtColor(np.array(image), cv2.COLOR_RGB2BGR)

        # Utiliser easyocr pour extraire le texte de l'image
        reader = easyocr.Reader(['en'])
        result = reader.readtext(image_np)

        # Afficher le texte extrait
        print("Texte extrait:")
        for detection in result:
            print(detection[1])  # Le texte extrait

        # Extraire des informations à partir du texte
        extract_information(result)

    except FileNotFoundError as e:
        print(f"Fichier non trouvé : {image_path}")
    except Exception as e:
        print(f"Une erreur s'est produite: {str(e)}")

def extract_information(result):
    # Afficher les informations extraites à partir des résultats de la détection de texte
    for detection in result:
        print(f"Position : {detection[0]}")
        print(f"Confiance : {detection[2]}")
        print()  # Laisser une ligne vide entre les détections

if __name__ == "__main__":
    print("3")
    image_path = input("Nom de votre image: ")
    process_your_image(image_path)
