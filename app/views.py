from django.shortcuts import render
from .models import *
from rest_framework import viewsets
from .serializers import *
from .forms import * #importa todos los forms que se crean
from django.contrib.auth import authenticate, login #para autenticar al usuario
from django.db import connection #trae los procesos almacenados
from rest_framework.response import Response
from django.views import View


# se crean clases para las api
class CheckInViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Checkin.objects.all()
    serializer_class = CheckInSerializer

class CheckOutViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Checkout.objects.all()
    serializer_class = CheckOutSerializer

class ClienteViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Cliente.objects.all()
    serializer_class = ClienteSerializer

class DepartamentoViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Departamento.objects.all()
    serializer_class = DepartamentoSerializer
    """ def listado_departamento():
        django_cursor = connection.cursor()
        cursor = django_cursor.connection.cursor()
        out_cur = django_cursor.connection.cursor()    
        cursor.callproc("SP_LISTAR_DEPARTAMENTO",[out_cur])
    
        lista = []
        for fila in out_cur:
            lista.append(fila)
        return Response(lista) """
    
class CiudadViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Ciudad.objects.all()
    serializer_class = CiudadSerializer

class ComunaViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Comuna.objects.all()
    serializer_class = ComunaSerializer

class PagoViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Pago.objects.all()
    serializer_class = PagoSerializer

class ConductorViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Conductor.objects.all()
    serializer_class = ConductorSerializer

class FuncionarioViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Funcionario.objects.all()
    serializer_class = FuncionarioSerializer

class ServicioextraViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Servicioextra.objects.all()
    serializer_class = ServicioextraSerializer

class TourViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Tour.objects.all()
    serializer_class = TourSerializer

class ReservaViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Reserva.objects.all()
    serializer_class = ReservaSerializer

class MantenimientoViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Mantenimiento.objects.all()
    serializer_class = MantenimientoSerializer

class MultaViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Multa.objects.all()
    serializer_class = MultaSerializer

class RegionViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Region.objects.all()
    serializer_class = RegionSerializer

class VehiculoViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Vehiculo.objects.all()
    serializer_class = VehiculoSerializer

class AcompanianteViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Acompaniante.objects.all()
    serializer_class = AcompanianteSerializer

#prueba 
class DepartamentoView(View):
    def get(self,request):
        django_cursor = connection.cursor()
        cursor = django_cursor.connection.cursor()
        out_cur = django_cursor.connection.cursor()    
        cursor.callproc("SP_LISTAR_DEPARTAMENTO",[out_cur])
    
        lista = []
        for fila in out_cur:
            lista.append(fila)
        return lista


# se crean las vistas (programación).

def home(request):
    print(DepartamentoView())
    return render(request, 'app/home.html')

def registro(request):
    data = {
        'form': CustomUserCreationForm
    }
    if request.method == 'POST':
        formulario = CustomUserCreationForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
            user = authenticate(username=formulario.cleaned_data["username"], password=formulario.cleaned_data["password1"])
            login(request, user)
            messages.sucess(request,"Resgistro Guardado")
            return redirect(to="home")  
        data["form"] = formulario
    return render(request, 'registration/registro.html',data)

def listar_ciudad(request):
    return render(request, 'app/ciudad.html')

""" def listado_departamento():
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()    
    cursor.callproc("SP_LISTAR_DEPARTAMENTO",[out_cur])
    
    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista """