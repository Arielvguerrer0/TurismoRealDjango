import cx_Oracle 
from django.db import connection

def listar_departamento():
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()    
    cursor.callproc("SP_LISTAR_DEPARTAMENTO",[out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def buscar_departamento(id):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()    
    cursor.callproc("SP_BUSCAR_DEPARTAMENTO",[id,out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def crear_departamento(NOMBRE_DEP,DIRECCION_DEPTO,DESCRIPCION_DEPTO,HABITACION,CALEFACCION,INTERNET,AMOBLADO,TELEVICION,VALOR_DIARIO,DISPONIBLE):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_CREAR_DEPARTAMENTO", [NOMBRE_DEP,DIRECCION_DEPTO,DESCRIPCION_DEPTO,HABITACION,CALEFACCION,INTERNET,AMOBLADO,TELEVICION,VALOR_DIARIO,DISPONIBLE,salida])
    return salida.getvalue()

def crear_region(nom_region):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_CREAR_REGION", [nom_region, salida])
    return salida.getvalue()