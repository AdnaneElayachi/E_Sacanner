import cv2
import pytesseract
import easyocr
from PIL import Image
import numpy as np

def get_field_name(position):
    x, y = position[0][0], position[0][1]

    if 18 <= x <= 232 and 24 <= y <= 50:
        return "Nom"
    elif 19 <= x <= 233 and 53 <= y <= 71:
        return "Date de naissance"
    else:
        return "Inconnu"

def print_detection_info(field_name, field_value, position, confidence):
    if field_name != "Inconnu":
        print(f"Valeur détectée : {field_value}")
        print(f"Champ : {field_name}")
        print(f"Position : {position}")
        print(f"Confiance : {confidence}")
        print()

def extract_information(result):
    for detection in result:
        print(f"Position : {detection[0]}")
        print(f"Confiance : {detection[2]}")
        print()

def process_your_image(image_path):
    try:
        print("**1")
        image = Image.open(image_path)
        image_np = cv2.cvtColor(np.array(image), cv2.COLOR_RGB2BGR)

        reader = easyocr.Reader(['en'])
        result = reader.readtext(image_np)

        print("Texte extrait:")
        for detection in result:
            field_name = get_field_name(detection[0])
            field_value = detection[1]
            print_detection_info(field_name, field_value, detection[0], detection[2])

        extract_information(result)

    except FileNotFoundError as e:
        print(f"Fichier non trouvé : {image_path}")
    except Exception as e:
        print(f"Une erreur s'est produite: {str(e)}")

if __name__ == "__main__":
    print("3")
    image_path = input("Nom de votre image: ")
    process_your_image(image_path)
