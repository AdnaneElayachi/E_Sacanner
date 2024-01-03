# Utilisez une image Python officielle de version 3.8
FROM python:3.8

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app/MonProjet

# Copiez le fichier requirements.txt dans le conteneur
COPY requirements.txt /app/MonProjet/

# Installez les dépendances du projet (requirements.txt)
RUN pip install --no-cache-dir -r requirements.txt

# Copiez tous les fichiers du répertoire actuel dans le conteneur
COPY . /app/MonProjet/

# Exposez le port 8000 pour permettre les connexions à l'extérieur du conteneur
EXPOSE 8000

# Commande par défaut à exécuter lorsque le conteneur démarre
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
