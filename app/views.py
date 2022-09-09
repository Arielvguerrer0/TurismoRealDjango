from django.shortcuts import render
from .models import *
from rest_framework import viewsets
from .serializers import *
from .forms import * #importa todos los forms que se crean
from django.contrib.auth import authenticate, login #para autenticar al usuario


# se crean clases para las api
class CheckInViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = CheckIn.objects.all()
    serializer_class = CheckInSerializer

class CheckOutViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = CheckOut.objects.all()
    serializer_class = CheckOutSerializer

class CiudadViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Ciudad.objects.all()
    serializer_class = CiudadSerializer

class ComunaViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Comuna.objects.all()
    serializer_class = ComunaSerializer

class DepartamentoViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Departamento.objects.all()
    serializer_class = DepartamentoSerializer

class EstadoDepartamentoViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = EstadoDepartamento.objects.all()
    serializer_class = EstadoDepartamentoSerializer

class MultaViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Multa.objects.all()
    serializer_class = MultaSerializer

class PaisViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Pais.objects.all()
    serializer_class = PaisSerializer

class PersonaViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Persona.objects.all()
    serializer_class = RegionSerializer

class RegionViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Region.objects.all()
    serializer_class = RegionSerializer

class ReservaViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Reserva.objects.all()
    serializer_class = ReservaSerializer

class ServicioViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Servicio.objects.all()
    serializer_class = ServicioSerializer

class TarifaViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Tarifa.objects.all()
    serializer_class = TarifaSerializer

class TipoUsuarioViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = CheckOut.objects.all()
    serializer_class = TipoUsuarioSerializer

class UsuarioViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Usuario.objects.all()
    serializer_class = UsuarioSerializer

# se crean las vistas (programación).

def home(request):
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