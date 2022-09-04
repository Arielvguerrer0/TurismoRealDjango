from .models import Departamento #se importa todo igual que en el models para que muestre todo de la base de datos
from rest_framework import serializers

class DepartamentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Departamento #la tabla que se uitlizara
        Fields = '__all__'#los atributos que se mostraran