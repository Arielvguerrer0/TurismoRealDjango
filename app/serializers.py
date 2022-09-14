from django.db.models import fields
from .models import * #se importa todo igual que en el models para que muestre todo de la base de datos
from rest_framework import serializers
import requests
#prueba para generar un estado
def generate_request(url, params={}):
    response = requests.get(url, params=params)

    if response.status_code == 200:
        return response.json()

""" def get_ciudad():
    resonse = generate_request('http://127.0.0.1:8000/api/ciudad/')
    if response:
        return response """
#fin de la prueba

class CheckInSerializer(serializers.ModelSerializer):
    class Meta:
        model = Checkin #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class CheckOutSerializer(serializers.ModelSerializer):
    class Meta:
        model = Checkout #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class ClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cliente #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class DepartamentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Departamento #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class MetodopagoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Metodopago #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class PersonaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Persona #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class RegistroarriSerializer(serializers.ModelSerializer):
    class Meta:
        model = Registroarri #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class RegistropagoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Registropago #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class ReservaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reserva #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class ServicioextraSerializer(serializers.ModelSerializer):
    class Meta:
        model = Servicioextra #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class TourSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tour #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran 
class TranscondcSerializer(serializers.ModelSerializer):
    class Meta:
        model = Transcondc #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class TransporteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Transporte #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class TransvehiSerializer(serializers.ModelSerializer):
    class Meta:
        model = Transvehi #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran 



#class CiudadSerializer(serializers.Serializer):
 #   id_ciudad = serializers.IntegerField(label="Ingrese id ciudad")
  #  nom_ciudad = serializers.CharField(label="Ingrese nombre de la ciudad")
   # region_id_region = serializers.IntegerField(label="Ingrese id de region")


