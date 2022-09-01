from django.urls import path
from .views import * #importa todas las vistas

urlpatterns = [
    path('', home, name="home"),
]
