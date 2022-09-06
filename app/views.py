from django.shortcuts import render
<<<<<<< HEAD
from .models import *
from rest_framework import viewsets
from .serializers import *

# se crean clases para las api

class CiudadViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Ciudad.objects.all()
    serializer_class = CiudadSerializer
=======
from rest_framework import viewsets
from .serializers import DepartamentoSerializer
# se crean clases para las api

class DepartamentoViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Departamento.objects.all()
    serializer_class = DepartamentoSerializer
>>>>>>> conexionapi

# se crean las vistas (programación).

def home(request):
    return render(request, 'app/home.html')
