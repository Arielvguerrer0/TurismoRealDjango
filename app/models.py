from django.db import models


class CheckIn(models.Model):
    id_check_in = models.AutoField(primary_key=True)
    fecha_llegada = models.DateField()
    reserva_id_reserva = models.BigIntegerField(unique=True)
    check_out_id_check_out = models.BigIntegerField(unique=True)

    class Meta:
        managed = False
        db_table = 'check_in'


class CheckOut(models.Model):
    id_check_out = models.AutoField(primary_key=True)
    fecha_salida = models.DateField()
    check_in_id_check_in = models.BigIntegerField(unique=True)

    class Meta:
        managed = False
        db_table = 'check_out'


class Ciudad(models.Model):
    id_ciudad = models.AutoField(primary_key=True)
    nom_ciudad = models.CharField(max_length=50)
    region_id_region = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'ciudad'


class Comuna(models.Model):
    id_comuna = models.AutoField(primary_key=True)
    nom_comuna = models.CharField(max_length=50)
    ciudad_id_ciudad = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'comuna'


class Departamento(models.Model):
    id_departamento = models.AutoField(primary_key=True)
    direccion = models.CharField(max_length=50)
    cant_dormitorio = models.BigIntegerField()
    cant_cama = models.BigIntegerField()
    cant_banno = models.BigIntegerField()
    cant_tv = models.BigIntegerField()
    aire_acondicionado = models.CharField(max_length=1)
    internet = models.CharField(max_length=1)
    tv_cable = models.CharField(max_length=1)
    estado_departamento_id_estado_departamento = models.BigIntegerField()
    tarifa_id_tarifa = models.BigIntegerField(unique=True)
    turismo_real_id_sucursal = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'departamento'


class EstadoDepartamento(models.Model):
    id_estado_departamento = models.AutoField(primary_key=True)
    estado_departamento = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'estado_departamento'


class Multa(models.Model):
    id_multa = models.AutoField(primary_key=True)
    tipo_multa = models.CharField(max_length=50)
    valor_multa = models.BigIntegerField()
    check_out_id_check_out = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'multa'


class Pais(models.Model):
    id_pais = models.AutoField(primary_key=True)
    nom_pais = models.CharField(max_length=50)
    persona_id_persona = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'pais'


class Persona(models.Model):
    id_persona = models.AutoField(primary_key=True)
    rut = models.CharField(max_length=9)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    fecha_nacimiento = models.DateField()
    edad = models.BigIntegerField()
    sexo = models.CharField(max_length=10)
    direccion = models.CharField(max_length=50)
    telefono = models.BigIntegerField(blank=True, null=True)
    correo = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'persona'


class Region(models.Model):
    id_region = models.AutoField(primary_key=True)
    nom_region = models.CharField(max_length=50)
    pais_id_pais = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'region'


class Reserva(models.Model):
    id_reserva = models.AutoField(primary_key=True)
    fecha_inicio = models.DateField()
    fecha_fin = models.DateField()
    cant_dia = models.BigIntegerField()
    valor_reserva = models.BigIntegerField()
    vigente = models.CharField(max_length=1, blank=True, null=True)
    check_in_id_check_in = models.BigIntegerField(unique=True)
    departamento_id_departamento = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'reserva'


class Servicio(models.Model):
    id_servicio = models.AutoField(primary_key=True)
    nom_servicio = models.CharField(max_length=50)
    tipo_servicio = models.CharField(max_length=50)
    reserva_id_reserva = models.BigIntegerField()
    tarifa_id_tarifa = models.BigIntegerField(unique=True)

    class Meta:
        managed = False
        db_table = 'servicio'


class Tarifa(models.Model):
    id_tarifa = models.AutoField(primary_key=True)
    valor = models.BigIntegerField()
    departamento_id_departamento = models.BigIntegerField(unique=True)
    servicio_id_servicio = models.BigIntegerField(unique=True)

    class Meta:
        managed = False
        db_table = 'tarifa'


class TipoUsuario(models.Model):
    id_tipo_usuario = models.AutoField(primary_key=True)
    tipo_usuario = models.CharField(max_length=50)
    usuario_id_usuario = models.BigIntegerField(unique=True)

    class Meta:
        managed = False
        db_table = 'tipo_usuario'


class TurismoReal(models.Model):
    id_sucursal = models.AutoField(primary_key=True)
    nombre_sucursal = models.CharField(max_length=50)
    telefono = models.BigIntegerField()
    correo = models.CharField(max_length=50)
    direccion = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'turismo_real'


class Usuario(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    correo = models.CharField(max_length=50)
    contrasena = models.CharField(max_length=20)
    habilitado = models.CharField(max_length=1)
    persona_id_persona = models.BigIntegerField()
    tipo_usuario_id_tipo_usuario = models.BigIntegerField(unique=True)
    turismo_real_id_sucursal = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'usuario'
