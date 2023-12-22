from django.db import models

class ResultatOCR(models.Model):
    champ = models.CharField(max_length=255)
    valeur = models.TextField()

    def __str__(self):
        return self.champ