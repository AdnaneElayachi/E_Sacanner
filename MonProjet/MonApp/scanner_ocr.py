import cv2
import pytesseract
import os
import pandas as pd
import re

def pretraiter_image(img):
   
    gris = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    return gris

def extraire_texte_de_l_image(chemin_image):
    try:
        img = cv2.imread(chemin_image)
        if img is None:
            raise Exception("Erreur : Impossible d'ouvrir l'image.")

        img_pretraitee = pretraiter_image(img)

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
            
        correspondance = re.match(r'(\w+)\s+(.+)', ligne)
        if correspondance:
            champ, valeur = correspondance.groups()
            data['Champ'].append(champ.strip())
            data['Valeur'].append(valeur.strip())
    
    df = pd.DataFrame(data)
    return df

def reconnaissance_ID(chemin_image):
    df = pd.DataFrame()

    try:
        img = cv2.imread(chemin_image)
        if img is None:
            raise Exception("Erreur : Impossible d'ouvrir l'image.")

        img_pretraitee = pretraiter_image(img)

        texte = pytesseract.image_to_string(img_pretraitee, lang='eng')

        if texte:
            
            print("Texte extrait :")
            print(texte)
            df = texte_vers_dataframe(texte)
        else:
            print("Aucun texte détecté dans l'image.")
    except Exception as e:
        print(str(e))

    return df

# # Exemple d'utilisation avec un chemin d'image statique
# resultat_df = reconnaissance_ID("chemin/vers/votre/image.jpg")
# print("DataFrame :")
# print(resultat_df)
