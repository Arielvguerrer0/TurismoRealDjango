from django.db.models import fields
from .models import * #se importa todo igual que en el models para que muestre todo de la base de datos
from rest_framework import serializers

class CheckInSerializer(serializers.ModelSerializer):
    class Meta:
        model = CheckIn #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class CiudadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ciudad #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

