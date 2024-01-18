import cv2
import pytesseract
import easyocr
import numpy as np  # Ajoutez cette ligne pour importer NumPy
from PIL import Image

def process_your_image(image_path):
    try:
       
        image = Image.open(image_path)

        image_np = cv2.cvtColor(np.array(image), cv2.COLOR_RGB2BGR)

        reader = easyocr.Reader(['en'])
        result = reader.readtext(image_np)

        print("Texte extrait:")
        for detection in result:
            print(detection[1])  # Le texte extrait

        extract_information(result)

    except FileNotFoundError as e:
        print(f"Fichier non trouvé : {image_path}")
    except Exception as e:
        print(f"Une erreur s'est produite: {str(e)}")

def extract_information(result):
    for detection in result:
        print(f"Position : {detection[0]}")
        print(f"Confiance : {detection[2]}")
        print()  

if __name__ == "__main__":
    print("3")
    image_path = input("Nom de votre image: ")
    process_your_image(image_path)
