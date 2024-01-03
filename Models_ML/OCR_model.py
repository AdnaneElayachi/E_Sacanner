import cv2
import pytesseract
import matplotlib.pyplot as plt

# Charger l'image
image = cv2.imread('Carte.jpg')

# Convertir en niveaux de gris
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# Appliquer la binarisation
_, binary_image = cv2.threshold(gray, 128, 255, cv2.THRESH_BINARY_INV)

# Trouver les contours
contours, _ = cv2.findContours(binary_image, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

# Parcourir les contours
for contour in contours:
    # Ignorer les petits contours
    if cv2.contourArea(contour) > 100:
        # Dessiner un rectangle autour de la zone de texte détectée
        x, y, w, h = cv2.boundingRect(contour)
        cv2.rectangle(image, (x, y), (x + w, y + h), (0, 255, 0), 2)

# Afficher l'image avec les zones de texte détectées en utilisant matplotlib
plt.imshow(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))
plt.title('Text Detection')
plt.show()
