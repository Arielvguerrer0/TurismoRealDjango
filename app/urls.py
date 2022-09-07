from django.urls import path, include
from .views import * #importa todas las vistas
from rest_framework import routers #para importar los serializers creados y ser vistos

router = routers.DefaultRouter()#permite crear urls para las api
router.register('ciudad', CiudadViewset)

urlpatterns = [
    path('', home, name="home"),
    path('api/', include(router.urls)),
    path('registro/', registro, name="registro"),
    
]
