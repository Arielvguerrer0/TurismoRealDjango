from django.db import models


class CheckIn(models.Model):
    id_check_in = models.BigIntegerField(primary_key=True)
    fecha_llegada = models.DateField()
    check_out_id_check_out = models.OneToOneField('CheckOut', models.DO_NOTHING, db_column='check_out_id_check_out')
    reserva_id_reserva = models.OneToOneField('Reserva', models.DO_NOTHING, db_column='reserva_id_reserva')

    class Meta:
        managed = False
        db_table = 'check_in'


class CheckOut(models.Model):
    id_check_out = models.BigIntegerField(primary_key=True)
    fecha_salida = models.DateField()
    check_in_id_check_in = models.OneToOneField(CheckIn, models.DO_NOTHING, db_column='check_in_id_check_in')

    class Meta:
        managed = False
        db_table = 'check_out'


class Ciudad(models.Model):
    id_ciudad = models.BigIntegerField(primary_key=True)
    nom_ciudad = models.CharField(max_length=50)
    region_id_region = models.ForeignKey('Region', models.DO_NOTHING, db_column='region_id_region')

    class Meta:
        managed = False
        db_table = 'ciudad'


class Comuna(models.Model):
    id_comuna = models.BigIntegerField(primary_key=True)
    nom_comuna = models.CharField(max_length=50)
    ciudad_id_ciudad = models.ForeignKey(Ciudad, models.DO_NOTHING, db_column='ciudad_id_ciudad')

    class Meta:
        managed = False
        db_table = 'comuna'


class Departamento(models.Model):
    id_departamento = models.BigIntegerField(primary_key=True)
    direccion = models.CharField(max_length=50)
    cant_dormitorio = models.BigIntegerField()
    cant_cama = models.BigIntegerField()
    cant_banno = models.BigIntegerField()
    cant_tv = models.BigIntegerField()
    aire_acondicionado = models.FloatField()
    internet = models.FloatField()
    tv_cable = models.FloatField()
    estado_departamento_id_estado_departamento = models.ForeignKey('EstadoDepartamento', models.DO_NOTHING, db_column='estado_departamento_id_estado_departamento')
    tarifa_id_tarifa = models.OneToOneField('Tarifa', models.DO_NOTHING, db_column='tarifa_id_tarifa')

    class Meta:
        managed = False
        db_table = 'departamento'


class EstadoDepartamento(models.Model):
    id_estado_departamento = models.BigIntegerField(primary_key=True)
    estado_departamento = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'estado_departamento'


class Multa(models.Model):
    id_multa = models.BigIntegerField(primary_key=True)
    tipo_multa = models.CharField(max_length=50)
    valor_multa = models.BigIntegerField()
    check_out_id_check_out = models.ForeignKey(CheckOut, models.DO_NOTHING, db_column='check_out_id_check_out')

    class Meta:
        managed = False
        db_table = 'multa'


class Pais(models.Model):
    id_pais = models.BigIntegerField(primary_key=True)
    nom_pais = models.CharField(max_length=50)
    persona_id_persona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='persona_id_persona')

    class Meta:
        managed = False
        db_table = 'pais'


class Persona(models.Model):
    id_persona = models.BigIntegerField(primary_key=True)
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
    id_region = models.BigIntegerField(primary_key=True)
    nom_region = models.CharField(max_length=50)
    pais_id_pais = models.ForeignKey(Pais, models.DO_NOTHING, db_column='pais_id_pais')

    class Meta:
        managed = False
        db_table = 'region'


class Reserva(models.Model):
    id_reserva = models.BigIntegerField(primary_key=True)
    nun_acompannante = models.BigIntegerField()
    fecha_inicio = models.DateField()
    fecha_fin = models.DateField()
    cant_dia = models.BigIntegerField()
    valor_reserva = models.BigIntegerField()
    vigente = models.FloatField(blank=True, null=True)
    check_in_id_check_in = models.OneToOneField(CheckIn, models.DO_NOTHING, db_column='check_in_id_check_in')
    departamento_id_departamento = models.ForeignKey(Departamento, models.DO_NOTHING, db_column='departamento_id_departamento')
    usuario_id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='usuario_id_usuario')

    class Meta:
        managed = False
        db_table = 'reserva'


class Servicio(models.Model):
    id_servicio = models.BigIntegerField(primary_key=True)
    nom_servicio = models.CharField(max_length=50)
    tipo_servicio = models.CharField(max_length=50)
    reserva_id_reserva = models.ForeignKey(Reserva, models.DO_NOTHING, db_column='reserva_id_reserva')
    tarifa_id_tarifa = models.OneToOneField('Tarifa', models.DO_NOTHING, db_column='tarifa_id_tarifa')

    class Meta:
        managed = False
        db_table = 'servicio'


class Tarifa(models.Model):
    id_tarifa = models.BigIntegerField(primary_key=True)
    valor = models.BigIntegerField()
    departamento_id_departamento = models.OneToOneField(Departamento, models.DO_NOTHING, db_column='departamento_id_departamento')
    servicio_id_servicio = models.OneToOneField(Servicio, models.DO_NOTHING, db_column='servicio_id_servicio')

    class Meta:
        managed = False
        db_table = 'tarifa'


class TipoUsuario(models.Model):
    id_tipo_usuario = models.BigIntegerField(primary_key=True)
    tipo_usuario = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'tipo_usuario'


class Usuario(models.Model):
    id_usuario = models.BigIntegerField(primary_key=True)
    correo = models.CharField(max_length=50)
    contrasena = models.CharField(max_length=20)
    habilitado = models.FloatField()
    persona_id_persona = models.ForeignKey(Persona, models.DO_NOTHING, db_column='persona_id_persona')
    id_tipo_usuario = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'usuario'
