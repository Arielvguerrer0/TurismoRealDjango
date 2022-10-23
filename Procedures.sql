--------------------------------------------------------
-- Archivo creado  - domingo-octubre-23-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure SP_BUSCAR_DEPARTAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_BUSCAR_DEPARTAMENTO" (id number,departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN departamento for SELECT * FROM departamento WHERE id_departamento = id;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_BUSCAR_DEPARTAMENTO_NOMBRE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_BUSCAR_DEPARTAMENTO_NOMBRE" (nom string,departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN departamento for SELECT * FROM departamento where nom_depto LIKE '%'+ nom + '%';
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_BUSCAR_RESERVA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_BUSCAR_RESERVA" (id number,reserva out SYS_REFCURSOR)
IS
BEGIN
    OPEN reserva for SELECT * FROM reserva WHERE id_reserva = id;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_BUSCAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_BUSCAR_USUARIO" (id number,usuario out SYS_REFCURSOR)
IS
BEGIN
    OPEN usuario for SELECT * FROM usuario WHERE id_usuario = id;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_BUSCAR_USUARIO_CORREO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_BUSCAR_USUARIO_CORREO" (correo string,usuario out SYS_REFCURSOR)
IS
BEGIN
    OPEN usuario for SELECT * FROM usuario WHERE correo_usuario = correo;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_CREAR_DEPARTAMENTOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_CREAR_DEPARTAMENTOS" (
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

/
--------------------------------------------------------
--  DDL for Procedure SP_CREAR_RESERVA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_CREAR_RESERVA" (FECHA_INGRESO DATE, FECHA_SALIDA DATE, CANT_DIA_RESERVA NUMBER, ESTADO_RESERVA VARCHAR2, FECHA_ESTADO_RESERVA DATE, 
DEPARTAMENTO_ID_DEPARTAMENTO NUMBER,USUARIO_ID_USUARIO NUMBER, respuesta out number)
IS
BEGIN
    insert into reserva values (seq_reserva.NEXTVAL, FECHA_INGRESO, FECHA_SALIDA, CANT_DIA_RESERVA, ESTADO_RESERVA, FECHA_ESTADO_RESERVA, DEPARTAMENTO_ID_DEPARTAMENTO, USUARIO_ID_USUARIO);
    respuesta := 1;
EXCEPTION
    WHEN OTHERS THEN
        respuesta := 0;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_CREAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_CREAR_USUARIO" (NOM_USUARIO VARCHAR, CORREO_USUARIO VARCHAR, CONTRASENIA VARCHAR, ESTADO_USUARIO CHAR, TIPO_USUARIO_ID_TIPO_USUARIO NUMBER, respuesta out number)
IS
BEGIN
    insert into usuario values (seq_usuario.NEXTVAL,NOM_USUARIO,CORREO_USUARIO, CONTRASENIA, ESTADO_USUARIO, TIPO_USUARIO_ID_TIPO_USUARIO);
    respuesta := 1;
EXCEPTION
    WHEN OTHERS THEN
        respuesta := 0;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_ELIMINAR_DEPARTAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_ELIMINAR_DEPARTAMENTO" (id number,salida out number)
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

/
--------------------------------------------------------
--  DDL for Procedure SP_ELIMINAR_RESERVA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_ELIMINAR_RESERVA" (id number,salida out number)
IS
BEGIN
DELETE
FROM
    reserva
WHERE
    id_reserva = id;
    salida:= 1;
EXCEPTION
    WHEN OTHERS THEN
        salida := 0;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_LISTAR_DEPARTAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_LISTAR_DEPARTAMENTO" (departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN departamento for SELECT * FROM departamento;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_LISTAR_DEPARTAMENTO_ADMIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_LISTAR_DEPARTAMENTO_ADMIN" (departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN departamento for select d.nom_depto as "NOMBRE DEPARTAMENTO", d.desc_depto as "DESCRIPCIÓN", d.direccion, d.cant_habitacion as "HABITACIONES", d.cant_banio as "CANTIDAD BAÑOS", d.calefaccion, d.internet, 
    d.amoblado, d.television, d.disponible, d.valor_dia as "VALOR", c.nom_comuna as "COMUNA"
    from departamento d, comuna c
    where d.comuna_id_comuna = c.id_comuna;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_LISTAR_RESERVA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_LISTAR_RESERVA" (reserva out SYS_REFCURSOR)
IS
BEGIN
    OPEN reserva for select r.fecha_ingreso "FECHA DE INGRESO", r.fecha_salida "FECHA DE SALIDA",r.cant_dia_reserva "DIAS RESERVADOS", r.estado_reserva "ESTADO", d.nom_depto "NOMBRE DEPTO", u.nom_usuario "NOMBRE USUARIO"
    from reserva r, departamento d, usuario u  
    where r.departamento_id_departamento = d.id_departamento and r.usuario_id_usuario = u.id_usuario;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_LISTAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_LISTAR_USUARIO" (usuario out SYS_REFCURSOR)
IS
BEGIN
    OPEN usuario for SELECT * FROM usuario;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_LISTAR_USUARIO_ADMIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_LISTAR_USUARIO_ADMIN" (usuario out SYS_REFCURSOR)
IS
BEGIN
    OPEN usuario for select u.nom_usuario, u.correo_usuario,tu.tipo_usuario,
    CASE when u.estado_usuario = 1 then 'Habilitado' else 'Deshabilitado' END "ESTADO_USUARIO"
    from usuario u, tipo_usuario tu
    where u.tipo_usuario_id_tipo_usuario = tu.id_tipo_usuario;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_MODIFICAR_DEPARTAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_MODIFICAR_DEPARTAMENTO" (id number,
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

/
--------------------------------------------------------
--  DDL for Procedure SP_MODIFICAR_RESERVA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_MODIFICAR_RESERVA" (id NUMBER,v_fecha_ingreso DATE, v_fecha_salida DATE, v_cant_dia_reserva NUMBER, v_estado_reserva CHAR, v_fecha_estado_reserva DATE, v_departamento_id_departamento NUMBER, v_usuario_id_usuario NUMBER, respuesta out number)
IS
BEGIN
    update reserva set FECHA_INGRESO = v_fecha_ingreso,
    FECHA_SALIDA = v_fecha_salida,
    CANT_DIA_RESERVA = v_cant_dia_reserva,
    ESTADO_RESERVA = v_estado_reserva,
    FECHA_ESTADO_RESERVA = v_fecha_estado_reserva,
    DEPARTAMENTO_ID_DEPARTAMENTO = v_departamento_id_departamento,
    USUARIO_ID_USUARIO = v_usuario_id_usuario
    WHERE id_reserva = id;
    respuesta := 1;
EXCEPTION
    WHEN OTHERS THEN
        respuesta := 0;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_MODIFICAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_MODIFICAR_USUARIO" (id NUMBER,v_nom_usuario VARCHAR, v_correo_usuario VARCHAR, v_contrasenia VARCHAR, v_estado_usuario CHAR, v_tipo_usuario_id_tipo_usuario NUMBER, respuesta out number)
IS
BEGIN
    update usuario set NOM_USUARIO = v_nom_usuario,
    CORREO_USUARIO = v_correo_usuario,
    CONTRASENIA = v_contrasenia,
    ESTADO_USUARIO = v_estado_usuario,
    TIPO_USUARIO_ID_TIPO_USUARIO = v_tipo_usuario_id_tipo_usuario
    WHERE id_usuario = id;
    respuesta := 1;
EXCEPTION
    WHEN OTHERS THEN
        respuesta := 0;
END;

/
