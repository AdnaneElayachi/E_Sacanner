from rest_framework import serializers
from .models import ResultatOCR

class ResultatOCRSerializer(serializers.ModelSerializer):
    class Meta:
        model = ResultatOCR
        fields = '__all__'