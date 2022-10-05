create or replace NONEDITIONABLE PROCEDURE sp_buscar_cliente(id number,cliente out SYS_REFCURSOR)
IS
BEGIN
    OPEN cliente for SELECT * FROM cliente WHERE id_cliente = id;
    
END;

create or replace NONEDITIONABLE PROCEDURE sp_buscar_departamento(id number,departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN departamento for SELECT * FROM departamento WHERE id_departamento = id;
END;

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

create sequence seq_departamentos
start with 1
increment by 1
maxvalue 99999
minvalue 1;

create or replace NONEDITIONABLE PROCEDURE sp_crear_region(nom_region VARCHAR, respuesta out number)
IS
BEGIN
    insert into region values (seq_region.NEXTVAL,nom_region);
    respuesta := 1;
EXCEPTION
    WHEN OTHERS THEN
        respuesta := 0;
END;

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

create or replace NONEDITIONABLE PROCEDURE sp_listar_cliente(cliente out SYS_REFCURSOR)
IS
BEGIN
    OPEN cliente for SELECT * FROM cliente;
END;

create or replace NONEDITIONABLE PROCEDURE sp_listar_departamento(departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN departamento for SELECT * FROM departamento;
END;

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

## Usuarios

create or replace NONEDITIONABLE PROCEDURE sp_crear_usuario(NOM_USUARIO VARCHAR, CORREO_USUARIO VARCHAR, CONTRASENIA VARCHAR, ESTADO_USUARIO CHAR, TIPO_USUARIO_ID_TIPO_USUARIO NUMBER, respuesta out number)
IS
BEGIN
    insert into usuario values (seq_usuario.NEXTVAL,NOM_USUARIO,CORREO_USUARIO, CONTRASENIA, ESTADO_USUARIO, TIPO_USUARIO_ID_TIPO_USUARIO);
    respuesta := 1;
EXCEPTION
    WHEN OTHERS THEN
        respuesta := 0;
END;

create or replace NONEDITIONABLE PROCEDURE sp_buscar_usuario(id number,usuario out SYS_REFCURSOR)
IS
BEGIN
    OPEN usuario for SELECT * FROM usuario WHERE id_usuario = id;
END;

create or replace NONEDITIONABLE PROCEDURE sp_crear_usuario(ID NUMBER,v_nom_usuario VARCHAR, v_correo_usuario VARCHAR, v_contrasenia VARCHAR, v_estado_usuario CHAR, v_tipo_usuario_id_tipo_usuario NUMBER, respuesta out number)
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

-----------------listar cliente----------------------
create or replace NONEDITIONABLE PROCEDURE sp_listar_cliente(cliente out SYS_REFCURSOR)
IS
BEGIN
    OPEN cliente for SELECT * FROM cliente;
END;
-------------buscar cliente----------------------
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
---------seq_cliente---------------
create sequence seq_cliente
start with 1
increment by 1
maxvalue 99999
minvalue 1;

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