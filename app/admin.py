from django.contrib import admin
from .models import Checkin, Checkout, Cliente, Departamento, Metodopago, Persona, Registroarri, Registropago, Reserva, Servicioextra, Tour, Transcondc, Transporte, Transvehi

admin.site.register(Checkin)
admin.site.register(Checkout)
admin.site.register(Cliente)
admin.site.register(Departamento)
admin.site.register(Metodopago)
admin.site.register(Persona)
admin.site.register(Registroarri)
admin.site.register(Registropago)
admin.site.register(Reserva)
admin.site.register(Servicioextra)
admin.site.register(Tour)
admin.site.register(Transcondc)
admin.site.register(Transporte)
admin.site.register(Transvehi)

