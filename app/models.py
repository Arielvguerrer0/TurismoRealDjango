from django.db import models


class CheckIn(models.Model):
    id_check_in = models.OneToOneField('Reserva', models.DO_NOTHING, db_column='id_check_in', primary_key=True)
    fecha_llegada = models.DateField()

    class Meta:
        managed = False
        db_table = 'check_in'


class CheckOut(models.Model):
    id_check_out = models.OneToOneField(CheckIn, models.DO_NOTHING, db_column='id_check_out', primary_key=True)
    fecha_salida = models.DateField()

    class Meta:
        managed = False
        db_table = 'check_out'


class Ciudad(models.Model):
    id_ciudad = models.OneToOneField('Region', models.DO_NOTHING, db_column='id_ciudad', primary_key=True)
    nom_ciudad = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'ciudad'


class Comuna(models.Model):
    id_comuna = models.OneToOneField(Ciudad, models.DO_NOTHING, db_column='id_comuna', primary_key=True)
    nom_comuna = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'comuna'


class Departamento(models.Model):
    id_departamento = models.OneToOneField('Tarifa', models.DO_NOTHING, db_column='id_departamento', primary_key=True)
    direccion = models.CharField(max_length=50)
    cant_dormitorio = models.FloatField()
    cant_cama = models.FloatField()
    cant_banno = models.FloatField()
    cant_tv = models.FloatField()
    aire_acondicionado = models.FloatField()
    internet = models.FloatField()
    tv_cable = models.FloatField()

    class Meta:
        managed = False
        db_table = 'departamento'


class EstadoDepartamento(models.Model):
    id_estado_departamento = models.FloatField(primary_key=True)
    estado_departamento = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'estado_departamento'


class Multa(models.Model):
    id_multa = models.OneToOneField(CheckOut, models.DO_NOTHING, db_column='id_multa', primary_key=True)
    tipo_multa = models.CharField(max_length=50)
    valor_multa = models.FloatField()

    class Meta:
        managed = False
        db_table = 'multa'


class Pais(models.Model):
    id_pais = models.FloatField(primary_key=True)
    nom_pais = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'pais'


class Persona(models.Model):
    id_persona = models.OneToOneField('Usuario', models.DO_NOTHING, db_column='id_persona', primary_key=True)
    rut = models.CharField(max_length=9)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    fecha_nacimiento = models.DateField()
    edad = models.FloatField()
    sexo = models.CharField(max_length=10)
    direccion = models.CharField(max_length=50)
    telefono = models.FloatField()
    correo = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'persona'


class Region(models.Model):
    id_region = models.OneToOneField(Pais, models.DO_NOTHING, db_column='id_region', primary_key=True)
    nom_region = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'region'


class Reserva(models.Model):
    id_reserva = models.OneToOneField('Usuario', models.DO_NOTHING, db_column='id_reserva', primary_key=True)
    num_acompannante = models.FloatField()
    fecha_inicio = models.DateField()
    fecha_salida = models.DateField()
    cant_dia = models.FloatField()
    valor_reserva = models.FloatField()

    class Meta:
        managed = False
        db_table = 'reserva'


class Servicio(models.Model):
    id_servicio = models.OneToOneField(Reserva, models.DO_NOTHING, db_column='id_servicio', primary_key=True)
    nom_servicio = models.CharField(max_length=50)
    tipo_servicio = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'servicio'


class Tarifa(models.Model):
    id_tarifa = models.OneToOneField(Servicio, models.DO_NOTHING, db_column='id_tarifa', primary_key=True)
    valor = models.FloatField()

    class Meta:
        managed = False
        db_table = 'tarifa'


class TipoUsuario(models.Model):
    id_tipo_usuario = models.FloatField(primary_key=True)
    tipo_usuario = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'tipo_usuario'


class Usuario(models.Model):
    id_usuario = models.FloatField(primary_key=True)
    correo = models.CharField(max_length=50)
    contrasena = models.CharField(max_length=20)
    habilitado = models.FloatField()

    class Meta:
        managed = False
        db_table = 'usuario'
