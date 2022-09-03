from django.contrib import admin
from .models import CheckIn,CheckOut,Ciudad,Comuna,Departamento,EstadoDepartamento,Multa,Pais,Persona,Region,Reserva,Servicio,Tarifa,TipoUsuario,TurismoReal,Usuario

admin.site.register(CheckIn)
admin.site.register(CheckOut)
admin.site.register(Ciudad)
admin.site.register(Comuna)
admin.site.register(Departamento)
admin.site.register(EstadoDepartamento)
admin.site.register(Multa)
admin.site.register(Pais)
admin.site.register(Persona)
admin.site.register(Region)
admin.site.register(Reserva)
admin.site.register(Servicio)
admin.site.register(Tarifa)
admin.site.register(TipoUsuario)
admin.site.register(TurismoReal)
admin.site.register(Usuario)

