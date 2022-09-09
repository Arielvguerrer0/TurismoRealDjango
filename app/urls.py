from django.urls import path, include
from .views import * #importa todas las vistas
from rest_framework import routers #para importar los serializers creados y ser vistos

router = routers.DefaultRouter()#permite crear urls para las api
router.register('checkin', CheckInViewset),
router.register('checkout', CheckOutViewset),
router.register('ciudad', CiudadViewset),
router.register('comuna', ComunaViewset),
router.register('departamento', DepartamentoViewset),
router.register('estadodepartamento', EstadoDepartamentoViewset),
router.register('multa', MultaViewset),
router.register('pais', PaisViewset),
router.register('persona', PersonaViewset),
router.register('region', RegionViewset),
router.register('reserva', ReservaViewset),
router.register('servicio', ServicioViewset),
router.register('tarifa', TarifaViewset),
router.register('tipousuario', TipoUsuarioViewset),
router.register('usuario', UsuarioViewset)


urlpatterns = [
    path('', home, name="home"),
    path('ciudad/', listar_ciudad, name="listar_ciudad"),
    path('api/', include(router.urls)),
    path('registro/', registro, name="registro"),
    
]
