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

def home(request):
    return render(request, 'app/home.html')

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

@api_view(['GET', 'POST'])
def departamento_list_admin(request):
    if request.method == 'GET':
        get_departamento = listar_departamento_admin()
        if(get_departamento != []):
            departamentos = []
            res = {}
            for depa in get_departamento:
                res = {}
                res['NOMBRE_DEPARTAMENTO'] = depa[0]
                res['DESCRIPCION'] = depa[1]
                res['DIRECCION'] = depa[2]
                res['HABITACIONES'] = depa[3]
                res['CANTIDAD_BAÑOS'] = depa[4]
                res['CALEFACCION'] = depa[5]
                res['INTERNET'] = depa[6]
                res['AMOBLADO'] = depa[7]
                res['TELEVISION'] = depa[8]
                res['DISPONIBLE'] = depa[9]
                res['VALOR'] = depa[10]
                res['COMUNA'] = depa[11]

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
            return Response({"Error": "No se existen departamentos con ese ID"}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response('Error', status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET'])
def departamento_list_nom(request,nom):
    if request.method == 'GET':
        nombre_dep = buscar_departamento_nombre(nom)
        if(nombre_dep != []):
            departamentos = []
            res = {}
            for depa in nombre_dep:
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
        elif(nombre_dep == []):
            return Response({"Error": "No se existen departamentos con ese Nombre"}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response('Error', status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['POST'])
def departamento_create(request):
    if request.method == 'POST':
        nombre_dep = request.data.get('NOM_DEPTO')
        descripcion_depto = request.data.get('DESC_DEPTO')
        direccion_depto = request.data.get('DIRECCION')
        habitacion = request.data.get('CANT_HABITACION')
        banio = request.data.get('CANT_BANIO')
        calefaccion = request.data.get('CALEFACCION')
        internet = request.data.get('INTERNET')
        amoblado = request.data.get('AMOBLADO')
        television = request.data.get('TELEVISION')
        disponible = request.data.get('DISPONIBLE')
        valor_diario= request.data.get('VALOR_DIA')
        comuna_id= request.data.get('COMUNA_ID_COMUNA')
        salida = crear_departamento(nombre_dep,descripcion_depto,direccion_depto,habitacion,banio,calefaccion,internet,amoblado,television,disponible,valor_diario,comuna_id)
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
            nombre_dep = request.data.get('NOM_DEPTO')
            descripcion_depto = request.data.get('DESC_DEPTO')
            direccion_depto = request.data.get('DIRECCION')
            habitacion = request.data.get('CANT_HABITACION')
            banio = request.data.get('CANT_BANIO')
            calefaccion = request.data.get('CALEFACCION')
            internet = request.data.get('INTERNET')
            amoblado = request.data.get('AMOBLADO')
            television = request.data.get('TELEVISION')
            disponible = request.data.get('DISPONIBLE')
            valor_diario= request.data.get('VALOR_DIA')
            comuna_id= request.data.get('COMUNA_ID_COMUNA')
        salida = modificar_departamento(id,nombre_dep,descripcion_depto,direccion_depto,habitacion,banio,calefaccion,internet,amoblado,television,disponible,valor_diario,comuna_id)
        if salida == 1:
            return Response({'response':'Se modifico correctamente el Departamento'}, status=status.HTTP_200_OK)
        else:
            return Response({'response':'Error'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)            

@api_view(['DELETE'])
def departamento_delete(request, id):
    if request.method == 'DELETE':
        get_departamento = eliminar_departamento(id)
        if(get_departamento == []):
            ##Revisar que cuando no se encuentre id deberia enviar mensaje de error.
            return  Response({'response':'No existe departamento con ese ID'}, status=status.HTTP_404_NOT_FOUND)
        else:
            salida = eliminar_departamento(id)
    if salida == 1:
        return Response({'response':'Se eliminó correctamente el Departamento'}, status=status.HTTP_200_OK)
    else:
        return Response({'response':'Error'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET', 'POST'])
def usuario_list(request):
    if request.method == 'GET':
        get_usuario = listar_usuario()
        if(get_usuario != []):
            usuarios = []
            res = {}
            for usuario in get_usuario:
                res = {}
                res['ID_USUARIO'] = usuario[0]
                res['NOM_USUARIO'] = usuario[1]
                res['CORREO_USUARIO'] = usuario[2]
                res['CONTRASENIA'] = usuario[3]
                res['ESTADO_USUARIO'] = usuario[4]
                res['TIPO_USUARIO_ID_TIPO_USUARIO'] = usuario[5]
                usuarios.append(res)
            return Response(usuarios, status=status.HTTP_200_OK)
        elif(get_usuario == []):
            return Response({"Error": "No se encontraron usuarios"}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response('Error', status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET', 'POST'])
def usuario_list_admin(request):
    if request.method == 'GET':
        get_usuario = listar_usuario_admin()
        if(get_usuario != []):
            usuarios = []
            res = {}
            for usuario in get_usuario:
                res = {}
                res['NOM_USUARIO'] = usuario[0]
                res['CORREO_USUARIO'] = usuario[1]
                res['TIPO_USUARIO'] = usuario[2]
                res['ESTADO_USUARIO'] = usuario[3]
                usuarios.append(res)
            return Response(usuarios, status=status.HTTP_200_OK)
        elif(get_usuario == []):
            return Response({"Error": "No se encontraron usuarios"}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response('Error', status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['POST'])
def usuario_create(request):
    if request.method == 'POST':
        NOM_USUARIO = request.data.get('NOM_USUARIO')
        CORREO_USUARIO = request.data.get('CORREO_USUARIO')
        CONTRASENIA = request.data.get('CONTRASENIA')
        ESTADO_USUARIO = request.data.get('ESTADO_USUARIO')
        TIPO_USUARIO_ID_TIPO_USUARIO = request.data.get('TIPO_USUARIO_ID_TIPO_USUARIO')
        
        salida = crear_usuario(NOM_USUARIO,CORREO_USUARIO,CONTRASENIA,ESTADO_USUARIO,TIPO_USUARIO_ID_TIPO_USUARIO)
        if salida == 1:
            return Response({'response':'Se creo correctamente el usuario'}, status=status.HTTP_201_CREATED)
        else:
            return Response({'response':'Error'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR) 


@api_view(['POST'])
def usuario_modify(request, id):
    if request.method == 'POST':
        usuario = buscar_usuario(id)
        if(usuario == []):
            return  Response({'response':'No existe usuario con ese ID'}, status=status.HTTP_404_NOT_FOUND)

        NOM_USUARIO = request.data.get('NOM_USUARIO')
        CORREO_USUARIO = request.data.get('CORREO_USUARIO')
        CONTRASENIA = request.data.get('CONTRASENIA')
        ESTADO_USUARIO = request.data.get('ESTADO_USUARIO')
        TIPO_USUARIO_ID_TIPO_USUARIO = request.data.get('TIPO_USUARIO_ID_TIPO_USUARIO')
        
        salida = modificar_usuario(id,NOM_USUARIO,CORREO_USUARIO,CONTRASENIA,ESTADO_USUARIO,TIPO_USUARIO_ID_TIPO_USUARIO)
        if salida == 1:
            return Response({'response':'Se modifico correctamente el usuario'}, status=status.HTTP_201_CREATED)
        else:
            return Response({'response':'Error'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR) 

@api_view(['GET'])
def get_usuario(request,id):
    if request.method == 'GET':
        get_usuario = buscar_usuario(id)
        if(get_usuario != []):
            usuario = []
            res = {}
            for user in get_usuario:
                res = {}
                res['ID_USUARIO'] = user[0]
                res['NOM_USUARIO'] = user[1]
                res['CORREO_USUARIO'] = user[2]
                res['CONTRASENIA'] = user[3]
                res['ESTADO_USUARIO'] = user[4]
                res['TIPO_USUARIO_ID_TIPO_USUARIO'] = user[5]

                usuario.append(res)
            return Response(usuario, status=status.HTTP_200_OK)
        elif(get_usuario == []):
            return Response({"Error": "No existe usuario con ese ID"}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response('Error', status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET'])
def get_usuario_correo(request,correo):
    if request.method == 'GET':
        get_usuario = buscar_usuario_correo(correo)
        if(get_usuario != []):
            usuario = []
            res = {}
            for user in get_usuario:
                res = {}
                res['ID_USUARIO'] = user[0]
                res['NOM_USUARIO'] = user[1]
                res['CORREO_USUARIO'] = user[2]
                res['CONTRASENIA'] = user[3]
                res['ESTADO_USUARIO'] = user[4]
                res['TIPO_USUARIO_ID_TIPO_USUARIO'] = user[5]

                usuario.append(res)
            return Response(usuario, status=status.HTTP_200_OK)
        elif(get_usuario == []):
            return Response({"Error": "No existe usuario con ese correo"}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response('Error', status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['GET', 'POST'])
def reserva_list(request):
    if request.method == 'GET':
        get_reserva = listar_reserva()
        if(get_reserva != []):
            reservas = []
            res = {}
            for reserva in get_reserva:
                res = {}
                res['FECHA DE INGRESO'] = reserva[0]
                res['FECHA DE SALIDA'] = reserva[1]
                res['DIAS RESERVADOS'] = reserva[2]
                res['ESTADO'] = reserva[3]
                res['NOMBRE DEPTO'] = reserva[4]
                res['NOMBRE USUARIO'] = reserva[5]
                reservas.append(res)
            return Response(reservas, status=status.HTTP_200_OK)
        elif(get_reserva == []):
            return Response({"Error": "No se encontraron reservas"}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response('Error', status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET', 'POST'])            
def reserva_bruto(request):
    if request.method == 'GET':
        get_reserva = listar_reserva_bruto()
        if(get_reserva != []):
            reservas = []
            res = {}
            for reserva in get_reserva:
                res = {}
                res['ID_RESERVA'] = reserva[0]
                res['FECHA_INGRESO'] = reserva[1]
                res['FECHA_SALIDA'] = reserva[2]
                res['CANT_DIA_RESERVA'] = reserva[3]
                res['ESTADO_RESERVA'] = reserva[4]
                res['FECHA_ESTADO_RESERVA '] = reserva[5]
                res['DEPARTAMENTO_ID_DEPARTAMENTO'] = reserva[6]
                res['USUARIO_ID_USUAIRO'] = reserva[7]
                reservas.append(res)
            return Response(reservas, status=status.HTTP_200_OK)
        elif(get_reserva == []):
            return Response({"Error": "No se encontraron reservas"}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response('Error', status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['POST'])
def reserva_create(request):
    if request.method == 'POST':
        FECHA_INGRESO = request.data.get('FECHA_INGRESO')
        FECHA_SALIDA = request.data.get('FECHA_SALIDA')
        CANT_DIA_RESERVA = request.data.get('CANT_DIA_RESERVA')
        ESTADO_RESERVA = request.data.get('ESTADO_RESERVA')
        FECHA_ESTADO_RESERVA = request.data.get('FECHA_ESTADO_RESERVA')
        DEPARTAMENTO_ID_DEPARTAMENTO = request.data.get('DEPARTAMENTO_ID_DEPARTAMENTO')
        USUARIO_ID_USUARIO = request.data.get('USUARIO_ID_USUARIO')
        
        salida = crear_reserva(FECHA_INGRESO,FECHA_SALIDA,CANT_DIA_RESERVA,ESTADO_RESERVA,FECHA_ESTADO_RESERVA,DEPARTAMENTO_ID_DEPARTAMENTO,USUARIO_ID_USUARIO)
        if salida == 1:
            return Response({'response':'Se creo correctamente la reserva'}, status=status.HTTP_201_CREATED)
        else:
            return Response({'response':'Error'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET'])
def get_reserva(request,id):
    if request.method == 'GET':
        get_reserva = buscar_reserva(id)
        if(get_reserva != []):
            reservas = []
            res = {}
            for reserva in get_reserva:
                res = {}
                res['ID_RESERVA'] = reserva[0]
                res['FECHA_INGRESO'] = reserva[1]
                res['FECHA_SALIDA'] = reserva[2]
                res['CANT_DIA_RESERVA'] = reserva[3]
                res['ESTADO_RESERVA'] = reserva[4]
                res['FECHA_ESTADO_RESERVA'] = reserva[5]
                res['DEPARTAMENTO_ID_DEPARTAMENTO'] = reserva[6]
                res['USUARIO_ID_USUARIO'] = reserva[7]
                reservas.append(res)
            return Response(reservas, status=status.HTTP_200_OK)
        elif(get_reserva == []):
            return Response({"Error": "No existe reserva con ese ID"}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response('Error', status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['POST'])
def reserva_modify(request, id):
    if request.method == 'POST':
        reserva = buscar_reserva(id)
        if(reserva == []):
            return  Response({'response':'No existe reserva con ese ID'}, status=status.HTTP_404_NOT_FOUND)

        FECHA_INGRESO = request.data.get('FECHA_INGRESO')
        FECHA_SALIDA = request.data.get('FECHA_SALIDA')
        CANT_DIA_RESERVA = request.data.get('CANT_DIA_RESERVA')
        ESTADO_RESERVA = request.data.get('ESTADO_RESERVA')
        FECHA_ESTADO_RESERVA = request.data.get('FECHA_ESTADO_RESERVA')
        DEPARTAMENTO_ID_DEPARTAMENTO = request.data.get('DEPARTAMENTO_ID_DEPARTAMENTO')
        USUARIO_ID_USUARIO = request.data.get('USUARIO_ID_USUARIO')
        
        salida = modificar_reserva(id,FECHA_INGRESO,FECHA_SALIDA,CANT_DIA_RESERVA,ESTADO_RESERVA,FECHA_ESTADO_RESERVA,DEPARTAMENTO_ID_DEPARTAMENTO,USUARIO_ID_USUARIO)
        if salida == 1:
            return Response({'response':'Se modifico correctamente la reserva'}, status=status.HTTP_201_CREATED)
        else:
            return Response({'response':'Error'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['DELETE'])
def reserva_delete(request, id):
    if request.method == 'DELETE':
        get_reserva = eliminar_reserva(id)
        if(get_reserva == []):
            ##Revisar que cuando no se encuentre id deberia enviar mensaje de error.
            return  Response({'response':'No existe reserva con ese ID'}, status=status.HTTP_404_NOT_FOUND)
        else:
            salida = eliminar_reserva(id)
    if salida == 1:
        return Response({'response':'Se eliminó correctamente la reserva'}, status=status.HTTP_200_OK)
    else:
        return Response({'response':'Error'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)