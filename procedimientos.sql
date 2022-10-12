------------------seq_cliente-----------------------------
create sequence seq_cliente
start with 1
increment by 1
maxvalue 99999
minvalue 1;

------------------listar cliente--------------------------
create or replace NONEDITIONABLE PROCEDURE sp_listar_cliente(cliente out SYS_REFCURSOR)
IS
BEGIN
    OPEN cliente for SELECT * FROM cliente;
END;
-------------------buscar cliente----------------------------
create or replace NONEDITIONABLE PROCEDURE sp_buscar_cliente(id number,cliente out SYS_REFCURSOR)
IS
BEGIN
    OPEN cliente for SELECT * FROM cliente WHERE id_cliente = id;
END;

--------------------crear cliente------------------------------
create or replace NONEDITIONABLE PROCEDURE sp_crear_cliente(
    rut_cliente varchar2,
    nom_cliente varchar2,
    apellido_paterno VARCHAR2,
    apellido_materno VARCHAR2,
    edad NUMBER,
    nacionalidad VARCHAR2,
    genero VARCHAR2,
    direccion_cliente VARCHAR2,
    telefono NUMBER,
    email VARCHAR2,
    usuario_id_usuario NUMBER,    
    salida out number)
IS
BEGIN
    insert into cliente values (seq_cliente.NEXTVAL,rut_cliente,nom_cliente,apellido_paterno,apellido_materno,edad,nacionalidad,genero,direccion_cliente,telefono,email,usuario_id_usuario);
    salida:= 1;
EXCEPTION
    WHEN OTHERS THEN
        salida := 0;
END;

------------eliminar cliente--------------------
create or replace NONEDITIONABLE PROCEDURE sp_eliminar_cliente(id number,salida out number)
IS
BEGIN
DELETE
FROM
    cliente
WHERE
    id_cliente = id;
    salida:= 1;
EXCEPTION
    WHEN OTHERS THEN
        salida := 0;
END;

------------modificar cliente-----------------------
create or replace NONEDITIONABLE PROCEDURE sp_modificar_cliente(id number,
    v_rut_cliente varchar2,
    v_nom_cliente varchar2,
    v_apellido_paterno VARCHAR2,
    v_apellido_materno VARCHAR2,
    v_edad NUMBER,
    v_nacionalidad VARCHAR2,
    v_genero VARCHAR2,
    v_direccion_cliente VARCHAR2,
    v_telefono NUMBER,
    v_email VARCHAR2,
    v_usuario_id_usuario NUMBER,    
    salida out number)
AS 
BEGIN 
UPDATE cliente SET 
    rut_cliente = v_rut_cliente,
    nom_cliente = v_nom_cliente,
    apellido_paterno = v_apellido_paterno,
    apellido_materno = v_apellido_materno,
    edad = v_edad,
    nacionalidad = v_nacionalidad,
    genero = v_genero,
    direccion_cliente = v_direccion_cliente,
    telefono = v_telefono,
    email = v_email,
    usuario_id_usuario = v_usuario_id_usuario
    WHERE id_cliente = id;
salida:= 1;
EXCEPTION
    WHEN OTHERS THEN
        salida := 0;
END;
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

------------------seq_departamentos-----------------------------
create sequence seq_departamentos
start with 1
increment by 1
maxvalue 99999
minvalue 1;

------------------Listar departamentos----------------------------
create or replace NONEDITIONABLE PROCEDURE sp_listar_departamento(departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN departamento for SELECT * FROM departamento;
END;


------------------Buscar Departamentos----------------------------
create or replace NONEDITIONABLE PROCEDURE sp_buscar_departamento(id number,departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN departamento for SELECT * FROM departamento WHERE id_departamento = id;
END;

------------------Crear Departamentos----------------------------
create or replace NONEDITIONABLE PROCEDURE sp_crear_departamentos(
    nom_depto varchar2,
    desc_depto varchar2,
    direccion VARCHAR2,
    cant_habitacion NUMBER,
    cant_banio NUMBER,
    CALEFACCION VARCHAR2,
    INTERNET VARCHAR2,
    AMOBLADO VARCHAR2,
    TELEVISION VARCHAR2,
    DISPONIBLE VARCHAR2,
    VALOR_DIA NUMBER,
    COMUNA_ID_COMUNA NUMBER,    
    salida out number)
IS
BEGIN
    insert into departamento values (seq_departamentos.NEXTVAL,nom_depto,desc_depto,direccion,cant_habitacion,cant_banio,calefaccion,internet,amoblado,television,disponible,valor_dia,comuna_id_comuna);
    salida:= 1;
EXCEPTION
    WHEN OTHERS THEN
        salida := 0;
END;

------------------Eliminar Departamentos----------------------------
create or replace NONEDITIONABLE PROCEDURE sp_eliminar_departamento(id number,salida out number)
IS
BEGIN
DELETE
FROM
    departamento
WHERE
    id_departamento = id;
    salida:= 1;
EXCEPTION
    WHEN OTHERS THEN
        salida := 0;
END;

------------------Modificar Departamentos----------------------------
create or replace NONEDITIONABLE PROCEDURE sp_modificar_departamento(id number,
    v_nom_depto varchar2,
    v_desc_depto varchar2,
    v_direccion VARCHAR2,
    v_cant_habitacion NUMBER,
    v_cant_banio NUMBER,
    v_CALEFACCION VARCHAR2,
    v_INTERNET VARCHAR2,
    v_AMOBLADO VARCHAR2,
    v_TELEVISION VARCHAR2,
    v_DISPONIBLE VARCHAR2,
    v_VALOR_DIA NUMBER,
    V_COMUNA_ID_COMUNA NUMBER,    
    salida out number)
AS 
BEGIN 
UPDATE departamento SET 
    nom_depto = v_nom_depto,
    desc_depto = v_desc_depto,
    direccion = v_direccion,
    cant_habitacion = v_cant_habitacion,
    cant_banio = v_cant_banio,
    CALEFACCION = v_CALEFACCION,
    INTERNET = v_INTERNET,
    AMOBLADO = v_AMOBLADO,
    TELEVISION = v_TELEVISION,
    DISPONIBLE = v_DISPONIBLE,
    VALOR_DIA = v_VALOR_DIA,
    comuna_id_comuna = v_comuna_id_comuna
    WHERE id_departamento = id;
salida:= 1;
EXCEPTION
    WHEN OTHERS THEN
        salida := 0;
END;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

-----------------Crear Usuarios-----------------------

create or replace NONEDITIONABLE PROCEDURE sp_crear_usuario(NOM_USUARIO VARCHAR, CORREO_USUARIO VARCHAR, CONTRASENIA VARCHAR, ESTADO_USUARIO CHAR, TIPO_USUARIO_ID_TIPO_USUARIO NUMBER, respuesta out number)
IS
BEGIN
    insert into usuario values (seq_usuario.NEXTVAL,NOM_USUARIO,CORREO_USUARIO, CONTRASENIA, ESTADO_USUARIO, TIPO_USUARIO_ID_TIPO_USUARIO);
    respuesta := 1;
EXCEPTION
    WHEN OTHERS THEN
        respuesta := 0;
END;


-----------------Buscar Usuarios-------------------------
create or replace NONEDITIONABLE PROCEDURE sp_buscar_usuario(id number,usuario out SYS_REFCURSOR)
IS
BEGIN
    OPEN usuario for SELECT * FROM usuario WHERE id_usuario = id;
END;

----------------Listar Usuarios----------------------------
create or replace NONEDITIONABLE PROCEDURE sp_listar_usuario(usuario out SYS_REFCURSOR)
IS
BEGIN
    OPEN usuario for SELECT * FROM usuario where ESTADO_USUARIO = 1;
END;


-----------------Modificar Usuarios------------------------
create or replace NONEDITIONABLE PROCEDURE sp_modificar_usuario(ID NUMBER,v_nom_usuario VARCHAR, v_correo_usuario VARCHAR, v_contrasenia VARCHAR, v_estado_usuario CHAR, v_tipo_usuario_id_tipo_usuario NUMBER, respuesta out number)
IS
BEGIN
    update usuario set nom_usuario = v_nom_usuario,
    correo_usuario = v_correo_usuario,
    contrasenia = v_contrasenia,
    ESTADO_USUARIO = v_estado_usuario,
    TIPO_USUARIO_ID_TIPO_USUARIO = v_tipo_usuario_id_tipo_usuario
    WHERE id_usuario = id;
    respuesta := 1;
EXCEPTION
    WHEN OTHERS THEN
        respuesta := 0;
END;


--------------------------------------------------------------------------------------------

Borrar los datos de las tablas Departamento, Comuna, Region 10/10/2022


Insertar las regiones de Chile.
QUERY:
insert into REGION (ID_REGION, NOM_REGION) values (1,'Arica y Parinacota');
insert into REGION (ID_REGION, NOM_REGION) values (2,'Tarapacá');
insert into REGION (ID_REGION, NOM_REGION) values (3,'Antofagasta');
insert into REGION (ID_REGION, NOM_REGION) values (4,'Atacama');
insert into REGION (ID_REGION, NOM_REGION) values (5,'Coquimbo');
insert into REGION (ID_REGION, NOM_REGION) values (6,'Valparaiso');
insert into REGION (ID_REGION, NOM_REGION) values (7,'Metropolitana de Santiago');
insert into REGION (ID_REGION, NOM_REGION) values (8,'Libertador General Bernardo OHiggins');
insert into REGION (ID_REGION, NOM_REGION) values (9,'Maule');
insert into REGION (ID_REGION, NOM_REGION) values (10,'Ñuble');
insert into REGION (ID_REGION, NOM_REGION) values (11,'Biobío');
insert into REGION (ID_REGION, NOM_REGION) values (12,'La Araucanía');
insert into REGION (ID_REGION, NOM_REGION) values (13,'Los Ríos');
insert into REGION (ID_REGION, NOM_REGION) values (14,'Los Lagos');
insert into REGION (ID_REGION, NOM_REGION) values (15,'Aysén del General Carlos Ibáñez del Campo');
insert into REGION (ID_REGION, NOM_REGION) values (16,'Magallanes y de la Antártica Chilena');


Insertar comunas con las regiones de Chile. (ID)
QUERY:
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (1,'Arica',1);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (2,'Camarones',1);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (3,'General Lagos',1);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (4,'Putre',1);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (5,'Alto Hospicio',2);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (6,'Iquique',2);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (7,'Camiña',2);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (8,'Colchane',2);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (9,'Huara',2);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (10,'Pica',2);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (11,'Pozo Almonte',2);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (12,'Tocopilla',3);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (13,'María Elena',3);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (14,'Calama',3);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (15,'Ollague',3);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (16,'San Pedro de Atacama',3);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (17,'Antofagasta',3);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (18,'Mejillones',3);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (19,'Sierra Gorda',3);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (20,'Taltal',3);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (21,'Chañaral',4);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (22,'Diego de Almagro',4);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (23,'Copiapó',4);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (24,'Caldera',4);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (25,'Tierra Amarilla',4);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (26,'Vallenar',4);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (27,'Alto del Carmen',4);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (28,'Freirina',4);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (29,'Huasco',4);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (30,'La Serena',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (31,'Coquimbo',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (32,'Andacollo',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (33,'La Higuera',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (34,'Paihuano',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (35,'Vicuña',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (36,'Ovalle',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (37,'Combarbalá',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (38,'Monte Patria',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (39,'Punitaqui',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (40,'Río Hurtado',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (41,'Illapel',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (42,'Canela',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (43,'Los Vilos',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (44,'Salamanca',5);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (45,'La Ligua',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (46,'Cabildo',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (47,'Zapallar',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (48,'Papudo',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (49,'Petorca',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (50,'Los Andes',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (51,'San Esteban',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (52,'Calle Larga',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (53,'Rinconada',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (54,'San Felipe',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (55,'Llaillay',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (56,'Putaendo',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (57,'Santa María',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (58,'Catemu',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (59,'Panquehue',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (60,'Quillota',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (61,'La Cruz',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (62,'La Calera',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (63,'Nogales',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (64,'Hijuelas',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (65,'Valparaíso',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (66,'Viña del Mar',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (67,'Concón',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (68,'Quintero',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (69,'Puchuncaví',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (70,'Casablanca',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (71,'Juan Fernández',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (72,'San Antonio',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (73,'Cartagena',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (74,'El Tabo',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (75,'El Quisco',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (76,'Algarrobo',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (77,'Santo Domingo',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (78,'Isla de Pascua',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (79,'Quilpué',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (80,'Limache',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (81,'Olmué',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (82,'Villa Alemana',6);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (83,'Colina',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (84,'Lampa',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (85,'Tiltil',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (86,'Santiago',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (87,'Vitacura',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (88,'San Ramón',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (89,'San Miguel',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (90,'San Joaquín',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (91,'Renca',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (92,'Recoleta',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (93,'Quinta Normal',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (94,'Quilicura',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (95,'Pudahuel',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (96,'Providencia',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (97,'Peñalolén',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (98,'Pedro Aguirre Cerda',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (99,'Ñuñoa',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (100,'Maipú',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (101,'Macul',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (102,'Lo Prado',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (103,'Lo Espejo',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (104,'Lo Barnechea',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (105,'Las Condes',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (106,'La Reina',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (107,'La Pintana',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (108,'La Granja',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (109,'La Florida',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (110,'La Cisterna',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (111,'Independencia',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (112,'Huechuraba',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (113,'Estación Central',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (114,'El Bosque',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (115,'Conchalí',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (116,'Cerro Navia',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (117,'Cerrillos',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (118,'Puente Alto',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (119,'San José de Maipo',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (120,'Pirque',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (121,'San Bernardo',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (122,'Buin',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (123,'Paine',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (124,'Calera de Tango',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (125,'Melipilla',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (126,'Alhué',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (127,'Curacaví',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (128,'María Pinto',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (129,'San Pedro',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (130,'Isla de Maipo',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (131,'El Monte',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (132,'Padre Hurtado',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (133,'Peñaflor',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (134,'Talagante',7);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (135,'Codegua',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (136,'Coínco',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (137,'Coltauco',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (138,'Doñihue',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (139,'Graneros',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (140,'Las Cabras',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (141,'Machalí',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (142,'Malloa',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (143,'Mostazal',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (144,'Olivar',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (145,'Peumo',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (146,'Pichidegua',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (147,'Quinta de Tilcoco',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (148,'Rancagua',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (149,'Rengo',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (150,'Requínoa',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (151,'San Vicente de Tagua Tagua',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (152,'Chépica',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (153,'Chimbarongo',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (154,'Lolol',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (155,'Nancagua',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (156,'Palmilla',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (157,'Peralillo',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (158,'Placilla',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (159,'Pumanque',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (160,'San Fernando',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (161,'Santa Cruz',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (162,'La Estrella',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (163,'Litueche',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (164,'Marchigüe',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (165,'Navidad',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (166,'Paredones',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (167,'Pichilemu',8);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (168,'Curicó',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (169,'Hualañé',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (170,'Licantén',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (171,'Molina',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (172,'Rauco',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (173,'Romeral',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (174,'Sagrada Familia',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (175,'Teno',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (176,'Vichuquén',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (177,'Talca',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (178,'San Clemente',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (179,'Pelarco',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (180,'Pencahue',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (181,'Maule',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (182,'San Rafael',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (183,'Curepto',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (184,'Constitución',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (185,'Empedrado',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (186,'Río Claro',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (187,'Linares',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (188,'San Javier',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (189,'Parral',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (190,'Villa Alegre',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (191,'Longaví',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (192,'Colbún',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (193,'Retiro',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (194,'Yerbas Buenas',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (195,'Cauquenes',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (196,'Chanco',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (197,'Pelluhue',9);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (198,'Bulnes',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (199,'Chillán',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (200,'Chillán Viejo',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (201,'El Carmen',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (202,'Pemuco',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (203,'Pinto',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (204,'Quillón',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (205,'San Ignacio',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (206,'Yungay',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (207,'Cobquecura',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (208,'Coelemu',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (209,'Ninhue',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (210,'Portezuelo',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (211,'Quirihue',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (212,'Ránquil',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (213,'Treguaco',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (214,'San Carlos',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (215,'Coihueco',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (216,'San Nicolás',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (217,'Ñiquén',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (218,'San Fabián',10);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (219,'Alto Biobío',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (220,'Antuco',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (221,'Cabrero',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (222,'Laja',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (223,'Los Ángeles',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (224,'Mulchén',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (225,'Nacimiento',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (226,'Negrete',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (227,'Quilaco',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (228,'Quilleco',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (229,'San Rosendo',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (230,'Santa Bárbara',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (231,'Tucapel',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (232,'Yumbel',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (233,'Concepción',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (234,'Coronel',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (235,'Chiguayante',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (236,'Florida',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (237,'Hualpén',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (238,'Hualqui',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (239,'Lota',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (240,'Penco',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (241,'San Pedro de La Paz',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (242,'Santa Juana',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (243,'Talcahuano',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (244,'Tomé',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (245,'Arauco',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (246,'Cañete',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (247,'Contulmo',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (248,'Curanilahue',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (249,'Lebu',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (250,'Los Álamos',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (251,'Tirúa',11);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (252,'Angol',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (253,'Collipulli',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (254,'Curacautín',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (255,'Ercilla',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (256,'Lonquimay',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (257,'Los Sauces',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (258,'Lumaco',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (259,'Purén',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (260,'Renaico',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (261,'Traiguén',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (262,'Victoria',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (263,'Temuco',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (264,'Carahue',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (265,'Cholchol',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (266,'Cunco',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (267,'Curarrehue',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (268,'Freire',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (269,'Galvarino',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (270,'Gorbea',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (271,'Lautaro',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (272,'Loncoche',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (273,'Melipeuco',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (274,'Nueva Imperial',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (275,'Padre Las Casas',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (276,'Perquenco',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (277,'Pitrufquén',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (278,'Pucón',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (279,'Saavedra',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (280,'Teodoro Schmidt',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (281,'Toltén',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (282,'Vilcún',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (283,'Villarrica',12);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (284,'Valdivia',13);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (285,'Corral',13);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (286,'Lanco',13);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (287,'Los Lagos',13);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (288,'Máfil',13);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (289,'Mariquina',13);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (290,'Paillaco',13);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (291,'Panguipulli',13);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (292,'La Unión',13);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (293,'Futrono',13);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (294,'Lago Ranco',13);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (295,'Río Bueno',13);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (296,'Osorno',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (297,'Puerto Octay',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (298,'Purranque',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (299,'Puyehue',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (300,'Río Negro',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (301,'San Juan de la Costa',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (302,'San Pablo',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (303,'Calbuco',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (304,'Cochamó',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (305,'Fresia',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (306,'Frutillar',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (307,'Llanquihue',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (308,'Los Muermos',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (309,'Maullín',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (310,'Puerto Montt',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (311,'Puerto Varas',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (312,'Ancud',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (313,'Castro',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (314,'Chonchi',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (315,'Curaco de Vélez',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (316,'Dalcahue',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (317,'Puqueldón',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (318,'Queilén',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (319,'Quellón',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (320,'Quemchi',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (321,'Quinchao',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (322,'Chaitén',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (323,'Futaleufú',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (324,'Hualaihué',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (325,'Palena',14);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (326,'Lago Verde',15);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (327,'Coihaique',15);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (328,'Aysén',15);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (329,'Cisnes',15);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (330,'Guaitecas',15);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (331,'Río Ibáñez',15);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (332,'Chile Chico',15);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (333,'Cochrane',15);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (334,'O\Higgins',15);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (335,'Tortel',15);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (336,'Natales',16);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (337,'Torres del Paine',16);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (338,'Laguna Blanca',16);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (339,'Punta Arenas',16);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (340,'Río Verde',16);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (341,'San Gregorio',16);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (342,'Porvenir',16);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (343,'Primavera',16);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (344,'Timaukel',16);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (345,'Cabo de Hornos',16);
insert into COMUNA (ID_COMUNA,NOM_COMUNA, REGION_ID_REGION) values (346,'Antártica',16);


--------------------------------------
Eliminar ID del usuario en tabla Tipo_Usuario

Eliminar Check in id chek in de la tabla Reserva
--------------------------------------

Tipo de usuario Create

insert into TIPO_USUARIO (ID_TIPO_USUARIO,TIPO_USUARIO) values (1,'Administrador');
insert into TIPO_USUARIO (ID_TIPO_USUARIO,TIPO_USUARIO) values (2,'Funcionario');
insert into TIPO_USUARIO (ID_TIPO_USUARIO,TIPO_USUARIO) values (3,'Cliente');

-----------------------------------------------

TOUR Create

insert into TOUR (ID_TOUR,NOM_TOUR,DESC_TOUR,VALOR_TOUR) values (1,'Laguna Verde','En esta excursión privada disfrutaras de un relajante día en Laguna Verde, una de las principales localidades turísticas de la región de Valparaíso. Recorrerás esta zona de la costa chilena con un guía en exclusiva, solo para ti y tu grupo.',30000);
insert into TOUR (ID_TOUR,NOM_TOUR,DESC_TOUR,VALOR_TOUR) values (2,'Volcan Villarica','¡Atrévete a escalar el cráter del volcán más activo de Chile y Sudamérica! El Volcán Villarrica, con 2.847 MSNM es conocido como el Rucapillán en Mapudungún, que literalmente significa “casa del espíritu”. Desde lo alto del Volcán!',50000);
insert into TOUR (ID_TOUR,NOM_TOUR,DESC_TOUR,VALOR_TOUR) values (3,'Valle del Elqui','El Tour Valle del Elqui desde La Serena dura todo el día, donde conocerás uno de los seis valles transversales de Chile. Descubriremos la magia que esconden sus pueblos, el lazo de Gabriela Mistral con esta tierra y los secretos de elaboración del pisco chileno acompañado de hermosos paisajes.',35000);
insert into TOUR (ID_TOUR,NOM_TOUR,DESC_TOUR,VALOR_TOUR) values (4,'Puerto varas','Esta aventura te permitirá conocer el activo Volcán Osorno cuya forma asombra por su perfección y los famosos Saltos del Petrohué: ambos relevantes hitos del sur de Chile. Un lago de origen glaciar con un volcán de forma perfecta, son parte de los atractivos que ofrece esta experiencia.',60000);
