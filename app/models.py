from django.db import models


class Acompaniante(models.Model):
    id_acompaniante = models.OneToOneField('Cliente', models.DO_NOTHING, db_column='id_acompaniante', primary_key=True)
    rut_acom = models.CharField(max_length=14)
    nombre_acom = models.CharField(max_length=50)
    apellido_acom = models.CharField(max_length=50)
    edad_acom = models.FloatField()
    email_acom = models.CharField(max_length=75)
    telefono_acom = models.FloatField()

    class Meta:
        managed = False
        db_table = 'acompaniante'


class Checkin(models.Model):
    check_in = models.OneToOneField('Reserva', models.DO_NOTHING, primary_key=True)
    check_in_fecha = models.DateField()
    check_in_observacion = models.CharField(max_length=300)

    class Meta:
        managed = False
        db_table = 'checkin'


class Checkout(models.Model):
    check_out = models.OneToOneField('Funcionario', models.DO_NOTHING, primary_key=True)
    check_out_fecha = models.DateField()
    check_out_observacion = models.CharField(max_length=300)

    class Meta:
        managed = False
        db_table = 'checkout'


class Ciudad(models.Model):
    id_ciudad = models.OneToOneField('Comuna', models.DO_NOTHING, db_column='id_ciudad', primary_key=True)
    nom_ciudad = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'ciudad'


class Cliente(models.Model):
    id_cliente = models.FloatField(primary_key=True)
    rut_cliente = models.CharField(max_length=14)
    nom_cliente = models.CharField(max_length=20)
    apellido_paterno_cliente = models.CharField(max_length=20)
    apellido_materno_cliente = models.CharField(max_length=20)
    edad = models.FloatField()
    nacionalidad = models.CharField(max_length=30)
    email_cliente = models.CharField(max_length=50)
    telefono_cliente = models.FloatField()
    direccion_cliente = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'cliente'


class Comuna(models.Model):
    id_comuna = models.OneToOneField('Region', models.DO_NOTHING, db_column='id_comuna', primary_key=True)
    nom_comuna = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'comuna'


class Conductor(models.Model):
    id_cond = models.OneToOneField('Vehiculo', models.DO_NOTHING, db_column='id_cond', primary_key=True)
    nombre_cond = models.CharField(max_length=30)
    apellido_cond = models.CharField(max_length=30)
    edad_cond = models.FloatField()
    nacionlidad_cond = models.CharField(max_length=30)
    email_cond = models.CharField(max_length=40)
    telefono_cond = models.FloatField()

    class Meta:
        managed = False
        db_table = 'conductor'


class Departamento(models.Model):
    CALE_CHOICES = (
        ('Si', 'Si'),
        ('No', 'No'),
    )
    INTERNET_CHOICES = (
        ('Si', 'Si'),
        ('No', 'No'),
    )
    AMOBLADO_CHOICES = (
        ('Si', 'Si'),
        ('No', 'No'),
    )
    TELEVICION_CHOICES = (
        ('Si', 'Si'),
        ('No', 'No'),
    )
    DISPONIBILIDADDEPART_CHOICES = (
        ('Si', 'Si'),
        ('No', 'No'),
    )
    id_depto = models.OneToOneField('Region', models.DO_NOTHING, db_column='id_depto', primary_key=True)
    nombre_dep = models.CharField(max_length=30)
    direccion_depto = models.CharField(max_length=75)
    descripcion_depto = models.CharField(max_length=300, blank=True, null=True)
    habitacion = models.FloatField()
    banio = models.FloatField()
    calefaccion = models.CharField(max_length=2, choices=CALE_CHOICES, default="Si")
    internet = models.CharField(max_length=2,choices=INTERNET_CHOICES, default="Si")
    amoblado = models.CharField(max_length=2,choices=AMOBLADO_CHOICES, default="Si")
    televicion = models.CharField(max_length=2,choices=TELEVICION_CHOICES, default="Si")
    valor_diario = models.FloatField()
    disponible = models.CharField(max_length=2,choices=DISPONIBILIDADDEPART_CHOICES, default="Si")

    class Meta:
        managed = False
        db_table = 'departamento'


class Funcionario(models.Model):
    id_fun = models.FloatField(primary_key=True)
    rut_fun = models.CharField(max_length=14)
    nombre_fun = models.CharField(max_length=20)
    apellido_paterno_fun = models.CharField(max_length=20)
    apellido_materno_fun = models.CharField(max_length=20)
    cargo = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'funcionario'


class Mantenimiento(models.Model):
    id_mtto = models.FloatField(primary_key=True)
    mtto_fecha_creacion = models.DateField()
    mtto_fecha_desde = models.DateField()
    mtto_fecha_hasta = models.DateField()
    mtto_observacion = models.CharField(max_length=300)

    class Meta:
        managed = False
        db_table = 'mantenimiento'


class Multa(models.Model):
    id_multa = models.FloatField(primary_key=True)
    descripcion_multa = models.CharField(max_length=1)
    monto_multa = models.CharField(max_length=1)
    estado_multa = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'multa'


class Pago(models.Model):
    TIPO_PAYMENT_CHOICES = [
        ('TARJETA', 'TARJETA'),
        ('EFECTIVO', 'EFECTIVO'),
        ('ABONO', 'ABONO'),
        ('OTRO', 'OTRO'),
    ]
    id_pago = models.OneToOneField('Reserva', models.DO_NOTHING, db_column='id_pago', primary_key=True)
    metodo_pago = models.CharField(max_length=20, choices=TIPO_PAYMENT_CHOICES, default="Abono")
    fecha_pago = models.DateField()
    pago_efectuado = models.CharField(max_length=20)
    monto_pago = models.FloatField()

    class Meta:
        managed = False
        db_table = 'pago'


class Region(models.Model):
    id_region = models.FloatField(primary_key=True)
    nom_region = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'region'


class Reserva(models.Model):
    CHECK_CHOICES = (
        ('NoCheck', 'NoCheck'),
        ('CheckIn', 'CheckIn'),
        ('CheckOut', 'CheckOut'),
    )
    cod_reserva = models.FloatField(primary_key=True)
    fecha_reserva_inicio = models.DateField()
    fecha_reserva_termino = models.DateField()
    cantidad_dias = models.FloatField()
    estado_reserva = models.CharField(max_length=50)
    estado_check = models.CharField(max_length=50, blank=True, null=True, default="No Check", choices=CHECK_CHOICES)

    class Meta:
        managed = False
        db_table = 'reserva'


class Servicioextra(models.Model):
    id_servicio = models.OneToOneField(Conductor, models.DO_NOTHING, db_column='id_servicio', primary_key=True)
    direccion_encuentro = models.CharField(max_length=75)
    direccion_destino = models.CharField(max_length=75)
    fecha_encuentro = models.DateField()
    fecha_termino = models.DateField()
    valor_servicio = models.FloatField()

    class Meta:
        managed = False
        db_table = 'servicioextra'


class Tour(models.Model):
    CATEGORIATOUR_CHOICES = (
        ('Tour City', 'Tour City'),
        ('Turismo Aventura', 'Turismo Aventura'),
    )
    COLACION_CHOICES = (
        ('Si', 'Si'),
        ('No', 'No'),
    )
    id_tour = models.FloatField(primary_key=True)
    descripcion_tour = models.CharField(max_length=300)
    categoria_tour = models.CharField(max_length=100, choices=CATEGORIATOUR_CHOICES, default="Tour City")
    colacion_tour = models.CharField(max_length=2, choices=COLACION_CHOICES, default="Si")
    valor_tour = models.FloatField()

    class Meta:
        managed = False
        db_table = 'tour'


class Vehiculo(models.Model):
    AIRE_CHOICES = (
        ('Si', 'Si'),
        ('No', 'No'),
    )
    patente = models.CharField(max_length=14)
    marca = models.CharField(max_length=50)
    modelo = models.CharField(max_length=50)
    color_vehiculo = models.CharField(max_length=50)
    cant_puerta = models.FloatField()
    cant_asiento = models.FloatField()
    aire_acondicionado = models.CharField(max_length=2, choices=AIRE_CHOICES, default="Si")
    id_vehiculo = models.FloatField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'vehiculo'
