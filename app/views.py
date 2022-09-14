from django.shortcuts import render
from .models import *
from rest_framework import viewsets
from .serializers import *
from .forms import * #importa todos los forms que se crean
from django.contrib.auth import authenticate, login #para autenticar al usuario


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

class MetodopagoViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Metodopago.objects.all()
    serializer_class = MetodopagoSerializer

class PersonatamentoViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Persona.objects.all()
    serializer_class = PersonaSerializer

class RegistroarriViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Registroarri.objects.all()
    serializer_class = RegistroarriSerializer

class RegistropagoViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Registropago.objects.all()
    serializer_class = RegistropagoSerializer

class ReservaViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Reserva.objects.all()
    serializer_class = ReservaSerializer

class ServicioextraViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Servicioextra.objects.all()
    serializer_class = ServicioextraSerializer

class TourViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Tour.objects.all()
    serializer_class = TourSerializer

class TranscondcViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Transcondc.objects.all()
    serializer_class = TranscondcSerializer

class TransporteViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Transporte.objects.all()
    serializer_class = TransporteSerializer

class TransvehiViewset(viewsets.ModelViewSet):#este se encarga de mostrar los datos y hasta guardar
    queryset = Transvehi.objects.all()
    serializer_class = TransvehiSerializer



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