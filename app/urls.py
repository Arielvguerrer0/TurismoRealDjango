from django.urls import path, include
from .views import * #importa todas las vistas
from rest_framework import routers #para importar los serializers creados y ser vistos

router = routers.DefaultRouter()#permite crear urls para las api
router.register('checkin', CheckInViewset),
router.register('checkout', CheckOutViewset),
router.register('cliente', ClienteViewset),
router.register('departamento', DepartamentoViewset),
router.register('metodopago', MetodopagoViewset),
router.register('reg_arriendo', RegistroarriViewset),
router.register('reg_pago', RegistropagoViewset),
router.register('reserva', ReservaViewset),
router.register('serve_extra', ServicioextraViewset),
router.register('tour', TourViewset),
router.register('trans_conductor', TranscondcViewset),
router.register('transporte', TransporteViewset),
router.register('trans_vehiculo', TransvehiViewset),



urlpatterns = [
    path('', home, name="home"),
    path('ciudad/', listar_ciudad, name="listar_ciudad"),
    path('api/', include(router.urls)),
    path('registro/', registro, name="registro"),
    
]
