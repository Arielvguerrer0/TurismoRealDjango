from django.db import models


class Checkin(models.Model):
    id_check_in = models.OneToOneField('Persona', models.DO_NOTHING, db_column='id_check_in', primary_key=True)
    descripcion = models.CharField(max_length=75)

    class Meta:
        managed = False
        db_table = 'checkin'


class Checkout(models.Model):
    id_check_out = models.OneToOneField('Registroarri', models.DO_NOTHING, db_column='id_check_out', primary_key=True)
    descripcion = models.CharField(max_length=75)

    class Meta:
        managed = False
        db_table = 'checkout'


class Cliente(models.Model):
    rut = models.FloatField(primary_key=True)
    nombre = models.CharField(max_length=75)
    apellido = models.CharField(max_length=75)
    telefono = models.FloatField()
    correo = models.CharField(max_length=60)
    contrasenia = models.CharField(max_length=75)

    class Meta:
        managed = False
        db_table = 'cliente'


class Departamento(models.Model):
    id_depto = models.FloatField(primary_key=True)
    metros_cua = models.FloatField()
    direccion = models.CharField(max_length=75)
    valor = models.FloatField()

    class Meta:
        managed = False
        db_table = 'departamento'


class Inventario(models.Model):
    id_inventario = models.FloatField(primary_key=True)
    habitacion = models.FloatField()
    cama = models.CharField(max_length=75)
    banio = models.FloatField()

    class Meta:
        managed = False
        db_table = 'inventario'


class Metodopago(models.Model):
    id_met_pago = models.FloatField(primary_key=True)
    descripcion = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'metodopago'


class Persona(models.Model):
    id_persona = models.FloatField(primary_key=True)
    nombre = models.CharField(max_length=75)
    apellido = models.CharField(max_length=75)
    rut = models.FloatField()
    telefono = models.FloatField()
    correo = models.CharField(max_length=75)
    c0ntrasenia = models.CharField(max_length=75)

    class Meta:
        managed = False
        db_table = 'persona'


class Registroarri(models.Model):
    id_registro_arri = models.OneToOneField(Checkin, models.DO_NOTHING, db_column='id_registro_arri', primary_key=True)
    descripcion = models.CharField(max_length=75)
    pago_total = models.CharField(max_length=75, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'registroarri'


class Registropago(models.Model):
    id_reg_pago = models.OneToOneField('Reserva', models.DO_NOTHING, db_column='id_reg_pago', primary_key=True)
    descripcion = models.CharField(max_length=75)
    pago_total = models.FloatField()

    class Meta:
        managed = False
        db_table = 'registropago'


class Reserva(models.Model):
    id_reserva = models.OneToOneField(Departamento, models.DO_NOTHING, db_column='id_reserva', primary_key=True)
    pago_reserva = models.FloatField()
    num_acomp = models.FloatField()
    fecha_entrada = models.DateField()
    fecha_salida = models.DateField()
    multa = models.FloatField()
    subtotal = models.FloatField()

    class Meta:
        managed = False
        db_table = 'reserva'


class Servicioextra(models.Model):
    id_servextra = models.OneToOneField('Transporte', models.DO_NOTHING, db_column='id_servextra', primary_key=True)
    tour = models.CharField(max_length=2)
    transporte = models.CharField(max_length=2)
    precio = models.FloatField()

    class Meta:
        managed = False
        db_table = 'servicioextra'


class Tour(models.Model):
    id_tour = models.FloatField(primary_key=True)
    lugar = models.CharField(max_length=75)
    fecha = models.DateField()
    estado = models.CharField(max_length=75)

    class Meta:
        managed = False
        db_table = 'tour'


class Transcondc(models.Model):
    id_conduc = models.OneToOneField('Transvehi', models.DO_NOTHING, db_column='id_conduc', primary_key=True)
    nombre_conduc = models.CharField(max_length=50)
    apellido_conduc = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'transcondc'


class Transporte(models.Model):
    id_transporte = models.OneToOneField(Transcondc, models.DO_NOTHING, db_column='id_transporte', primary_key=True)
    direccion = models.CharField(max_length=75)
    destino = models.CharField(max_length=75)
    zona = models.CharField(max_length=75)
    comuna = models.CharField(max_length=75)
    fecha_trans = models.DateField()

    class Meta:
        managed = False
        db_table = 'transporte'


class Transvehi(models.Model):
    id_vehiculo = models.FloatField(primary_key=True)
    modelo = models.CharField(max_length=50)
    anio = models.FloatField()

    class Meta:
        managed = False
        db_table = 'transvehi'
