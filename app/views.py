from django.shortcuts import render
from rest_framework import viewsets
from .serializers import DepartamentoSerializer
# se crean clases para las api

class DepartamentoViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Departamento.objects.all()
    serializer_class = DepartamentoSerializer

# se crean las vistas (programación).

def home(request):
    return render(request, 'app/home.html')
