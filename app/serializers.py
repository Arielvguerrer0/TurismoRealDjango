from django.db.models import fields
from .models import * #se importa todo igual que en el models para que muestre todo de la base de datos
from rest_framework import serializers
import requests
#prueba para generar un estado
def generate_request(url, params={}):
    response = requests.get(url, params=params)

    if response.status_code == 200:
        return response.json()

def get_ciudad():
    resonse = generate_request('http://127.0.0.1:8000/api/ciudad/')
    if response:
        return response
#fin de la prueba

class CheckInSerializer(serializers.ModelSerializer):
    class Meta:
        model = CheckIn #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class CheckOutSerializer(serializers.ModelSerializer):
    class Meta:
        model = CheckOut #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class CiudadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ciudad #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class ComunaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comuna #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class DepartamentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Departamento #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class EstadoDepartamentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = EstadoDepartamento #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class MultaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Multa #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class PaisSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pais #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class PersonaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Persona #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class RegionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Region #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class ReservaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reserva #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class ServicioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Servicio #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class TarifaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tarifa #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class TipoUsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoUsuario #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran

class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuario #la tabla que se utilizara
        fields = '__all__'#los atributos que se mostraran



#class CiudadSerializer(serializers.Serializer):
 #   id_ciudad = serializers.IntegerField(label="Ingrese id ciudad")
  #  nom_ciudad = serializers.CharField(label="Ingrese nombre de la ciudad")
   # region_id_region = serializers.IntegerField(label="Ingrese id de region")


