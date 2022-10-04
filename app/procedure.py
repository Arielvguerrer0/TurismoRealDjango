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

def crear_departamento(nombre_dep,direccion_depto,descripcion_depto,habitacion,banio,calefaccion,internet,amoblado,televicion,valor_diario,disponible):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_CREAR_DEPARTAMENTOS", [nombre_dep,direccion_depto,descripcion_depto,habitacion,banio,calefaccion,internet,amoblado,televicion,valor_diario,disponible,salida])
    return salida.getvalue()

def modificar_departamento(id,nombre_dep,descripcion_depto,direccion_depto,habitacion,banio,calefaccion,internet,amoblado,television,disponible,valor_diario,comuna_id):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_MODIFICAR_DEPARTAMENTO", [id,nombre_dep,descripcion_depto,direccion_depto,habitacion,banio,calefaccion,internet,amoblado,television,disponible,valor_diario,comuna_id,salida])
    return salida.getvalue()

def eliminar_departamento(id):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_ELIMINAR_DEPARTAMENTO", [id,salida])
    return salida.getvalue()


def crear_region(nom_region):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_CREAR_REGION", [nom_region, salida])
    return salida.getvalue()