from django.urls import path, include
from .views import * #importa todas las vistas
from rest_framework import routers #para importar los serializers creados y ser vistos

router = routers.DefaultRouter()#permite crear urls para las api
router.register('Checkin', CheckInViewset),
router.register('Checkout', CheckOutViewset),
router.register('Cliente', ClienteViewset),
router.register('Departamento', DepartamentoViewset), ####
router.register('Acompaniante', AcompanianteViewset),
router.register('Ciudad', CiudadViewset),
router.register('Comuna', ComunaViewset),
router.register('Conductor', ConductorViewset),
router.register('serve_extra', ServicioextraViewset),
router.register('tour', TourViewset),
router.register('Funcionario', FuncionarioViewset),
router.register('Reserva', ReservaViewset),
router.register('Mantenimiento', MantenimientoViewset),
router.register('Multa', MultaViewset),
router.register('Pago', PagoViewset),
router.register('Region', RegionViewset),
router.register('Vehiculo', VehiculoViewset),



urlpatterns = [
    path('', home, name="home"),
    path('api/', include(router.urls)),
    #Departamentos
    path('departamento/', departamento_list),
    path('departamentoAdmin/', departamento_list_admin),
    path('departamento/<id>', departamento_list_id),
    path('departamento/buscar/<nom>', departamento_list_nom),
    path('departamento/crear/', departamento_create),
    path('departamento/modificar/<id>', departamento_modify),
    path('departamento/eliminar/<id>', departamento_delete),
    #Usuarios
    path('usuario/', usuario_list),
    path('usuarioAdmin/', usuario_list_admin),
    path('usuario/crear/', usuario_create),
    path('usuario/<id>', get_usuario),
    path('usuariocorreo/<correo>', get_usuario_correo),
    path('usuario/modificar/<id>', usuario_modify),
   #Reserva
    path('reserva/', reserva_list),
    path('listarReservaID/', ReservaID_list),
    path('reservabruto/', reserva_bruto),
    path('reserva/crear', reserva_create),
    path('reserva/<id>', get_reserva),
    path('reserva/modificar/<id>', reserva_modify),
    path('reserva/eliminar/<id>', reserva_delete),
    path('reservausuario/<id>', get_reserva_usuario),
    #mttoDepartamento
    path('mttoDepartamento/', mttoDepartamento_list),
    path('mttoDepartamento/crear/', mttoDepartamento_create),
    path('mttoDepartamento/<id>', get_mttoDepartamento),
    path('mttoDepartamento/modificar/<id>', mttoDepartamento_modify),
    path('mttoDepartamento/eliminar/<id>', mttoDepartamento_delete),
    #Cliente
    path('listarCliente/', cliente_list),
    path('cliente/crear/', cliente_create),
    path('cliente/<id>', get_cliente),
    path('cliente/modificar/<id>', cliente_modify),
    path('cliente/eliminar/<id>', cliente_delete),
    #CheckIn
    path('listarCheckIn/', checkIn_list),
    path('checkIn/crear/', checkIn_create),
    path('checkIn/<id>', get_checkIn),
    path('checkIn/modificar/<id>', checkIn_modify),
    path('checkIn/eliminar/<id>', checkIn_delete),
    #CheckOut
    path('listarCheckOut/', checkOut_list),
    path('checkOut/crear/', checkOut_create),
    path('checkOut/<id>', get_checkOut),
    path('checkOut/modificar/<id>', checkOut_modify),
    path('checkOut/eliminar/<id>', checkOut_delete),

    #Inventario
    path('listarInventario/', inventario_list),
    path('inventario/crear/', inventario_create),
    path('inventario/<id>', get_inventario),
    path('inventario/modificar/<id>', inventario_modify),
    path('inventario/eliminar/<id>', inventario_delete),

    #Servicio Extra
    path('listarServicioExtra/', servExtra_list),
    path('ServicioExtra/crear/', servExtra_create),
    path('ServicioExtra/<id>', get_servExtra),
    path('ServicioExtra/modificar/<id>', servExtra_modify),
    path('ServicioExtra/eliminar/<id>', servExtra_delete),

    #Pago 
    path('listarPagoID/', pagoID_list),
    path('pago/crear/', pago_create),

    #Orden de compra
    path('OrdenCompra/crear/', OrdenCompra_create),
    path('OrdenCompra/modificar/<id>', OrdenCompra_modify),
    path('OrdenCompra/<id>', get_OrdenCompra),


    ##Transbank
    path('transbank/crear/', create_transaction),
    path('transbank/commit/', commit_transaction),
]