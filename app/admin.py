from django.contrib import admin
from .models import Acompaniante, Checkin, Checkout, Ciudad, Cliente, Comuna, Conductor, Departamento, Funcionario, Mantenimiento, Multa, Pago,  Region,  Reserva, Servicioextra, Tour,  Vehiculo

admin.site.register(Checkin)
admin.site.register(Checkout)
admin.site.register(Cliente)
admin.site.register(Departamento)
admin.site.register(Acompaniante)
admin.site.register(Ciudad)
admin.site.register(Comuna)
admin.site.register(Region)
admin.site.register(Reserva)
admin.site.register(Servicioextra)
admin.site.register(Tour)
admin.site.register(Conductor)
admin.site.register(Funcionario)
admin.site.register(Mantenimiento)
admin.site.register(Multa)
admin.site.register(Pago)
admin.site.register(Vehiculo)

