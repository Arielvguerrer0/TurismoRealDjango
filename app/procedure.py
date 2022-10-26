import cx_Oracle 
from django.db import connection

## Departamentos
def listar_departamento():
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()    
    cursor.callproc("SP_LISTAR_DEPARTAMENTO",[out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def listar_departamento_admin():
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()    
    cursor.callproc("sp_listar_departamento_admin",[out_cur])

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

def buscar_departamento_nombre(nom):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()    
    cursor.callproc("SP_BUSCAR_DEPARTAMENTO_NOMBRE",[nom,out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista


def crear_departamento(nombre_dep,descripcion_depto,direccion_depto,habitacion,banio,calefaccion,internet,amoblado,television,disponible,valor_diario,comuna_id):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_CREAR_DEPARTAMENTOS", [nombre_dep,descripcion_depto,direccion_depto,habitacion,banio,calefaccion,internet,amoblado,television,disponible,valor_diario,comuna_id,salida])
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

## Usuarios
def listar_usuario():
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()    
    cursor.callproc("SP_LISTAR_USUARIO",[out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def listar_usuario_admin():
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()    
    cursor.callproc("SP_LISTAR_USUARIO_ADMIN",[out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def crear_usuario(NOM_USUARIO,CORREO_USUARIO, CONTRASENIA, ESTADO_USUARIO, TIPO_USUARIO_ID_TIPO_USUARIO):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_CREAR_USUARIO", [NOM_USUARIO,CORREO_USUARIO, CONTRASENIA, ESTADO_USUARIO, TIPO_USUARIO_ID_TIPO_USUARIO, salida])
    return salida.getvalue()

def buscar_usuario(id):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()
    cursor.callproc("SP_BUSCAR_USUARIO",[id,out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def buscar_usuario_correo(correo):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()
    cursor.callproc("SP_BUSCAR_USUARIO_CORREO",[correo,out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def modificar_usuario(ID,NOM_USUARIO,CORREO_USUARIO, CONTRASENIA, ESTADO_USUARIO, TIPO_USUARIO_ID_TIPO_USUARIO):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_MODIFICAR_USUARIO", [ID,NOM_USUARIO,CORREO_USUARIO, CONTRASENIA, ESTADO_USUARIO, TIPO_USUARIO_ID_TIPO_USUARIO, salida])
    return salida.getvalue()

## Reservas
def listar_reserva():
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()    
    cursor.callproc("SP_LISTAR_RESERVA",[out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def listar_reserva_bruto():
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()    
    cursor.callproc("SP_LISTAR_RESERVA_BRUTO",[out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def crear_reserva(FECHA_INGRESO,FECHA_SALIDA,CANT_DIA_RESERVA,ESTADO_RESERVA,FECHA_ESTADO_RESERVA,DEPARTAMENTO_ID_DEPARTAMENTO,USUARIO_ID_USUARIO):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_CREAR_RESERVA", [FECHA_INGRESO,FECHA_SALIDA,CANT_DIA_RESERVA,ESTADO_RESERVA,FECHA_ESTADO_RESERVA,DEPARTAMENTO_ID_DEPARTAMENTO,USUARIO_ID_USUARIO, salida])
    return salida.getvalue()

def buscar_reserva(id):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()
    cursor.callproc("SP_BUSCAR_RESERVA",[id,out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def modificar_reserva(ID,FECHA_INGRESO,FECHA_SALIDA,CANT_DIA_RESERVA,ESTADO_RESERVA,FECHA_ESTADO_RESERVA,DEPARTAMENTO_ID_DEPARTAMENTO,USUARIO_ID_USUARIO):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("sp_modificar_reserva", [ID,FECHA_INGRESO,FECHA_SALIDA,CANT_DIA_RESERVA,ESTADO_RESERVA,FECHA_ESTADO_RESERVA,DEPARTAMENTO_ID_DEPARTAMENTO,USUARIO_ID_USUARIO, salida])
    return salida.getvalue()

def eliminar_reserva(id):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_ELIMINAR_RESERVA", [id,salida])
    return salida.getvalue()

#Mantenimiento Departamento
def listar_mttoDepartamento():
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()    
    cursor.callproc("SP_LISTAR_MTTODEPARTAMENTO",[out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def crear_mttoDepartamento(FECHA_INGRESO,FECHA_SALIDA,DESCRIPCION_MTTO,DISPONIBILIDAD,DEPARTAMENTO_ID_DEPARTAMENTO):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_CREAR_MTTODEPARTAMENTO", [FECHA_INGRESO,FECHA_SALIDA,DESCRIPCION_MTTO,DISPONIBILIDAD,DEPARTAMENTO_ID_DEPARTAMENTO, salida])
    return salida.getvalue()

def buscar_mttoDepartamento(id):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()
    cursor.callproc("SP_BUSCAR_MTTODEPARTAMENTO",[id,out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def modificar_mttoDepartamento(ID,FECHA_INGRESO,FECHA_SALIDA,DESCRIPCION_MTTO,DISPONIBILIDAD,DEPARTAMENTO_ID_DEPARTAMENTO):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("sp_modificar_mttoDepartamento", [ID,FECHA_INGRESO,FECHA_SALIDA,DESCRIPCION_MTTO,DISPONIBILIDAD,DEPARTAMENTO_ID_DEPARTAMENTO, salida])
    return salida.getvalue()

def eliminar_mttoDepartamento(id):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_ELIMINAR_mttoDepartamento", [id,salida])
    return salida.getvalue()

#Mantenimiento Cliente
def listar_cliente():
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()    
    cursor.callproc("SP_LISTAR_CLIENTE",[out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def crear_cliente(RUT_CLIENTE,NOM_CLIENTE,APELLIDO_PATERNO,APELLIDO_MATERNO,EDAD,NACIONALIDAD,GENERO,DIRECCION_CLIENTE,TELEFONO,EMAIL,USUARIO_ID_USUARIO):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("SP_CREAR_CLIENTE", [RUT_CLIENTE,NOM_CLIENTE,APELLIDO_PATERNO,APELLIDO_MATERNO,EDAD,NACIONALIDAD,GENERO,DIRECCION_CLIENTE,TELEFONO,EMAIL,USUARIO_ID_USUARIO, salida])
    return salida.getvalue()

def buscar_cliente(id):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    out_cur = django_cursor.connection.cursor()
    cursor.callproc("SP_BUSCAR_CLIENTE",[id,out_cur])

    lista = []
    for fila in out_cur:
        lista.append(fila)
    return lista

def modificar_cliente(ID,RUT_CLIENTE,NOM_CLIENTE,APELLIDO_PATERNO,APELLIDO_MATERNO,EDAD,NACIONALIDAD,GENERO,DIRECCION_CLIENTE,TELEFONO,EMAIL,USUARIO_ID_USUARIO):
    django_cursor = connection.cursor()
    cursor = django_cursor.connection.cursor()
    salida = cursor.var(cx_Oracle.NUMBER)
    cursor.callproc("sp_modificar_cliente", [ID,RUT_CLIENTE,NOM_CLIENTE,APELLIDO_PATERNO,APELLIDO_MATERNO,EDAD,NACIONALIDAD,GENERO,DIRECCION_CLIENTE,TELEFONO,EMAIL,USUARIO_ID_USUARIO, salida])
    return salida.getvalue()