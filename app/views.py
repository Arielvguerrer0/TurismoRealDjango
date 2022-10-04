from django.shortcuts import render
from .models import *
from rest_framework import viewsets, status
from .serializers import *
from .forms import * #importa todos los forms que se crean
from django.contrib.auth import authenticate, login #para autenticar al usuario
from django.db import connection #trae los procesos almacenados
from rest_framework.response import Response
from django.views import View
from rest_framework.decorators import api_view
from .procedure import *



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


@api_view(['GET', 'POST'])
def departamento_list(request):
    if request.method == 'GET':
        get_departamento = listar_departamento()
        if(get_departamento != []):
            departamentos = []
            res = {}
            for depa in get_departamento:
                res = {}
                res['ID_DEPTO'] = depa[0]
                res['NOM_DEPTO'] = depa[1]
                res['DESC_DEPTO'] = depa[2]
                res['DIRECCION'] = depa[3]
                res['CANT_HABITACION'] = depa[4]
                res['CANT_BANIO'] = depa[5]
                res['CALEFACCION'] = depa[6]
                res['INTERNET'] = depa[7]
                res['AMOBLADO'] = depa[8]
                res['TELEVISION'] = depa[9]
                res['DISPONIBLE'] = depa[10]
                res['VALOR_DIA'] = depa[11]
                res['COMUNA_ID_COMUNA'] = depa[12]

                departamentos.append(res)
            return Response(departamentos, status=status.HTTP_200_OK)
        elif(get_departamento == []):
            return Response({"Error": "No se encontraron departamentos"}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response('Error', status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET'])
def departamento_list_id(request,id):
    if request.method == 'GET':
        get_departamento = buscar_departamento(id)
        if(get_departamento != []):
            departamentos = []
            res = {}
            for depa in get_departamento:
                res = {}
                res['ID_DEPTO'] = depa[0]
                res['NOMBRE_DEP'] = depa[1]
                res['DIRECCION_DEPTO'] = depa[2]
                res['DESCRIPCION_DEPTO'] = depa[3]
                res['HABITACION'] = depa[4]
                res['BANIO'] = depa[5]
                res['CALEFACCION'] = depa[6]
                res['INTERNET'] = depa[7]
                res['AMOBLADO'] = depa[8]
                res['TELEVICION'] = depa[9]
                res['VALOR_DIARIO'] = depa[10]
                res['DISPONIBLE'] = depa[11]
                departamentos.append(res)
            return Response(departamentos, status=status.HTTP_200_OK)
        elif(get_departamento == []):
            return Response({"Error": "No se existen departamentos con ese ID"}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response('Error', status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['POST'])
def departamento_create(request):
    if request.method == 'POST':
        nombre_dep = request.data.get('nombre_dep')
        direccion_depto = request.data.get('direccion_depto')
        descripcion_depto = request.data.get('descripcion_depto')
        habitacion = request.data.get('habitacion')
        banio = request.data.get('banio')
        calefaccion = request.data.get('calefaccion')
        internet = request.data.get('internet')
        amoblado = request.data.get('amoblado')
        televicion = request.data.get('televicion')
        valor_diario = request.data.get('valor_diario')
        disponible= request.data.get('disponible')
        salida = crear_departamento(nombre_dep,direccion_depto,descripcion_depto,habitacion,banio,calefaccion,internet,amoblado,televicion,valor_diario,disponible)
        if salida == 1:
            return Response({'response':'Se creo correctamente la Departamento'}, status=status.HTTP_201_CREATED)
        else:
            return Response({'response':'Error'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR) 


@api_view(['POST'])
def departamento_modify(request, id):
    if request.method == 'POST':
        #Primero deberiamos verificar que el departamento exista
        get_departamento = buscar_departamento(id)
        if(get_departamento == []):
            #Revisar que cuando no se encuentre id deberia enviar mensaje de error.
            return  Response({'response':'No existe departamento con ese ID'}, status=status.HTTP_404_NOT_FOUND)
        else:
            nombre_dep = request.data.get('nombre_dep')
            print('NOMBRE', nombre_dep)
            direccion_depto = request.data.get('direccion_depto')
            descripcion_depto = request.data.get('descripcion_depto')
            habitacion = request.data.get('habitacion')
            banio = request.data.get('banio')
            calefaccion = request.data.get('calefaccion')
            internet = request.data.get('internet')
            amoblado = request.data.get('amoblado')
            televicion = request.data.get('televicion')
            valor_diario = request.data.get('valor_diario')
            disponible= request.data.get('disponible')
        salida = modificar_departamento(id,nombre_dep,direccion_depto,descripcion_depto,habitacion,banio,calefaccion,internet,amoblado,televicion,valor_diario,disponible)
        if salida == 1:
            return Response({'response':'Se modifico correctamente el Departamento'}, status=status.HTTP_200_OK)
        else:
            return Response({'response':'Error'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)            

@api_view(['POST'])
def departamento_delete(request, id):
    if request.method == 'POST':
        get_departamento = buscar_departamento(id)
        if(get_departamento == []):
            ##Revisar que cuando no se encuentre id deberia enviar mensaje de error.
            return  Response({'response':'No existe departamento con ese ID'}, status=status.HTTP_404_NOT_FOUND)
        else:
            salida = eliminar_departamento(id)
    if salida == 1:
        return Response({'response':'Se eliminó correctamente el Departamento'}, status=status.HTTP_200_OK)
    else:
        return Response({'response':'Error'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR) 

@api_view(['POST'])
def region(request):
    if request.method == 'POST':
        nom_region = request.data.get('nom_region')
        region = crear_region(nom_region)
        if region == 1:
            return Response({'response':'Se creo correctamente la region'}, status=status.HTTP_201_CREATED)
        else:
            return Response({'response':'Error'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

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

""" def listado_departamento():
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()    
    cursor.callproc("SP_LISTAR_DEPARTAMENTO",[out_cur])
    
    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista """