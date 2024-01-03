import cv2
import pytesseract
import os
import pandas as pd
import re

def pretraiter_image(img):
    # Ajoutez des étapes de prétraitement supplémentaires si nécessaire
    gris = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    return gris

def extraire_texte_de_l_image(chemin_image):
    try:
        img = cv2.imread(chemin_image)
        if img is None:
            raise Exception("Erreur : Impossible d'ouvrir l'image.")

        # Prétraiter l'image
        img_pretraitee = pretraiter_image(img)

        # Utiliser Tesseract OCR pour extraire le texte
        texte = pytesseract.image_to_string(img_pretraitee, lang='eng')

        return texte.strip()
    except Exception as e:
        return str(e)

def texte_vers_dataframe(texte):
    data = {
        'Champ': [],
        'Valeur': []
    }
    
    lignes = texte.split('\n')
    
    for ligne in lignes:
        if not ligne.strip():
            continue
            
        # Utiliser des expressions régulières pour extraire les champs et les valeurs
        correspondance = re.match(r'(\w+)\s+(.+)', ligne)
        if correspondance:
            champ, valeur = correspondance.groups()
            data['Champ'].append(champ.strip())
            data['Valeur'].append(valeur.strip())
    
    df = pd.DataFrame(data)
    return df

def reconnaissance_ID():
    df = pd.DataFrame()
    while True:
        # Demander à l'utilisateur d'entrer le chemin d'une image
        chemin_image = input("Entrez le chemin de l'image (ou 'exit' pour quitter) : ")

        if chemin_image.lower() == 'exit':
            break

        # Vérifier si le fichier existe
        if not os.path.isfile(chemin_image):
            print("Erreur : Le fichier spécifié n'existe pas. Veuillez réessayer.")
            continue

        # Extraire le texte de l'image
        texte_extrait = extraire_texte_de_l_image(chemin_image)

        # Vérifier si le texte a été extrait avec succès
        if texte_extrait:
            # Afficher le texte extrait
            print("Texte extrait :")
            print(texte_extrait)
            df = texte_vers_dataframe(texte_extrait)
            break
        else:
            print("Aucun texte détecté dans l'image. Veuillez essayer une autre image.")
    return df

# Exemple d'utilisation
resultat_df = reconnaissance_ID()
print("DataFrame :")
print(resultat_df)
