--------------------------------------------------------
-- Archivo creado  - viernes-noviembre-04-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence Check-In_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."Check-In_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence CLIENTE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."CLIENTE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence COMUNA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."COMUNA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 381 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence DEPARTAMENTO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."DEPARTAMENTO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence DEPARTAMENTO_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."DEPARTAMENTO_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence MTTO_DEPARTAMENTO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."MTTO_DEPARTAMENTO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence REGION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."REGION_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence RESERVA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."RESERVA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CHECKIN
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."SEQ_CHECKIN"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CLIENTE
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."SEQ_CLIENTE"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_DEPARTAMENTOS
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."SEQ_DEPARTAMENTOS"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MTTO_DEPARTAMENTO
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."SEQ_MTTO_DEPARTAMENTO"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RESERVA
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."SEQ_RESERVA"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_USUARIO
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."SEQ_USUARIO"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence USUARIO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TREAL1"."USUARIO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Trigger Check-In_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##TREAL1"."Check-In_TRG" 
BEFORE INSERT ON "CHECK_IN" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID_CHECK_IN IS NULL THEN
      SELECT "Check-In_SEQ".NEXTVAL INTO :NEW.ID_CHECK_IN FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "C##TREAL1"."Check-In_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CLIENTE_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##TREAL1"."CLIENTE_TRG" 
BEFORE INSERT ON CLIENTE 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID_CLIENTE IS NULL THEN
      SELECT CLIENTE_SEQ.NEXTVAL INTO :NEW.ID_CLIENTE FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "C##TREAL1"."CLIENTE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COMUNA_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##TREAL1"."COMUNA_TRG" 
BEFORE INSERT ON COMUNA 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID_COMUNA IS NULL THEN
      SELECT COMUNA_SEQ.NEXTVAL INTO :NEW.ID_COMUNA FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "C##TREAL1"."COMUNA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEPARTAMENTO_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##TREAL1"."DEPARTAMENTO_TRG" 
BEFORE INSERT ON DEPARTAMENTO 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "C##TREAL1"."DEPARTAMENTO_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEPARTAMENTO_TRG1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##TREAL1"."DEPARTAMENTO_TRG1" 
BEFORE INSERT ON DEPARTAMENTO 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID_DEPARTAMENTO IS NULL THEN
      SELECT DEPARTAMENTO_SEQ1.NEXTVAL INTO :NEW.ID_DEPARTAMENTO FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "C##TREAL1"."DEPARTAMENTO_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MTTO_DEPARTAMENTO_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##TREAL1"."MTTO_DEPARTAMENTO_TRG" 
BEFORE INSERT ON MTTO_DEPARTAMENTO 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID_MTTO IS NULL THEN
      SELECT MTTO_DEPARTAMENTO_SEQ.NEXTVAL INTO :NEW.ID_MTTO FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "C##TREAL1"."MTTO_DEPARTAMENTO_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger REGION_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##TREAL1"."REGION_TRG" 
BEFORE INSERT ON REGION 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "C##TREAL1"."REGION_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RESERVA_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##TREAL1"."RESERVA_TRG" 
BEFORE INSERT ON RESERVA 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID_RESERVA IS NULL THEN
      SELECT RESERVA_SEQ.NEXTVAL INTO :NEW.ID_RESERVA FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "C##TREAL1"."RESERVA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USUARIO_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##TREAL1"."USUARIO_TRG" 
BEFORE INSERT ON USUARIO 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID_USUARIO IS NULL THEN
      SELECT USUARIO_SEQ.NEXTVAL INTO :NEW.ID_USUARIO FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "C##TREAL1"."USUARIO_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure SP_BUSCAR_CLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_BUSCAR_CLIENTE" (id number,cliente out SYS_REFCURSOR)
IS
BEGIN
    OPEN cliente for SELECT * FROM cliente WHERE id_cliente = id;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_BUSCAR_DEPARTAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_BUSCAR_DEPARTAMENTO" (id number,departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN departamento for SELECT * FROM departamento WHERE id_departamento = id;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_BUSCAR_DEPARTAMENTO_NOMBRE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_BUSCAR_DEPARTAMENTO_NOMBRE" (nom string,departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN departamento for SELECT * FROM departamento where nom_depto LIKE '%'+ nom + '%';
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_BUSCAR_MTTODEPARTAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_BUSCAR_MTTODEPARTAMENTO" (id number,mtto_departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN mtto_departamento for SELECT * FROM mtto_departamento WHERE id_mtto = id;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_BUSCAR_RESERVA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_BUSCAR_RESERVA" (id number,reserva out SYS_REFCURSOR)
IS
BEGIN
    OPEN reserva for SELECT * FROM reserva WHERE id_reserva = id;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_BUSCAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_BUSCAR_USUARIO" (id number,usuario out SYS_REFCURSOR)
IS
BEGIN
    OPEN usuario for SELECT * FROM usuario WHERE id_usuario = id;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_BUSCAR_USUARIO_CORREO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_BUSCAR_USUARIO_CORREO" (correo string,usuario out SYS_REFCURSOR)
IS
BEGIN
    OPEN usuario for SELECT * FROM usuario WHERE correo_usuario = correo;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_CREAR_CHECKIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_CREAR_CHECKIN" (
FECHA_CHECK_IN DATE, 
OBSERVACION VARCHAR2, 
RESERVA_ID_RESERVA NUMBER, 
respuesta out number)
IS
BEGIN
    insert into check_in values (seq_checkIn.NEXTVAL, FECHA_CHECK_IN,OBSERVACION,RESERVA_ID_RESERVA);
    respuesta := 1;
EXCEPTION
    WHEN OTHERS THEN
        respuesta := 0;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_CREAR_CLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_CREAR_CLIENTE" (RUT_CLIENTE NUMBER, NOM_CLIENTE VARCHAR2, APELLIDO_PATERNO VARCHAR2, APELLIDO_MATERNO VARCHAR2, EDAD NUMBER, 
NACIONALIDAD VARCHAR2,GENERO VARCHAR2,DIRECCION_CLIENTE VARCHAR2,TELEFONO NUMBER,EMAIL VARCHAR2, USUARIO_ID_USUARIO NUMBER, respuesta out number)
IS
BEGIN
    insert into cliente values (seq_cliente.NEXTVAL, RUT_CLIENTE, NOM_CLIENTE, APELLIDO_PATERNO, APELLIDO_MATERNO, EDAD, NACIONALIDAD, GENERO, DIRECCION_CLIENTE, TELEFONO, EMAIL, USUARIO_ID_USUARIO);
    respuesta := 1;
EXCEPTION
    WHEN OTHERS THEN
        respuesta := 0;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_CREAR_DEPARTAMENTOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_CREAR_DEPARTAMENTOS" (
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
--  DDL for Procedure SP_CREAR_MTTODEPARTAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_CREAR_MTTODEPARTAMENTO" (FECHA_INGRESO DATE, FECHA_SALIDA DATE, DESCRIPCION_MTTO VARCHAR, DISPONIBILIDAD VARCHAR, DEPARTAMENTO_ID_DEPARTAMENTO NUMBER, respuesta out number)
IS
BEGIN
    insert into mtto_departamento values (seq_mtto_departamento.NEXTVAL,FECHA_INGRESO,FECHA_SALIDA,DESCRIPCION_MTTO,DISPONIBILIDAD,DEPARTAMENTO_ID_DEPARTAMENTO);
    respuesta := 1;
EXCEPTION
    WHEN OTHERS THEN
        respuesta := 0;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_CREAR_RESERVA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_CREAR_RESERVA" (FECHA_INGRESO DATE, FECHA_SALIDA DATE, CANT_DIA_RESERVA NUMBER, ESTADO_RESERVA VARCHAR2, FECHA_ESTADO_RESERVA DATE, 
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

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_CREAR_USUARIO" (NOM_USUARIO VARCHAR, CORREO_USUARIO VARCHAR, CONTRASENIA VARCHAR, ESTADO_USUARIO CHAR, TIPO_USUARIO_ID_TIPO_USUARIO NUMBER, respuesta out number)
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
--  DDL for Procedure SP_ELIMINAR_CLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_ELIMINAR_CLIENTE" (id number,salida out number)
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

/
--------------------------------------------------------
--  DDL for Procedure SP_ELIMINAR_DEPARTAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_ELIMINAR_DEPARTAMENTO" (id number,salida out number)
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
--  DDL for Procedure SP_ELIMINAR_MTTODEPARTAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_ELIMINAR_MTTODEPARTAMENTO" (id number,salida out number)
IS
BEGIN
DELETE
FROM
    mtto_departamento
WHERE
    id_mtto = id;
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

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_ELIMINAR_RESERVA" (id number,salida out number)
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
--  DDL for Procedure SP_LISTAR_CHECKIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_LISTAR_CHECKIN" (check_in out SYS_REFCURSOR)
IS
BEGIN
    OPEN check_in for SELECT * FROM check_in;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_LISTAR_CLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_LISTAR_CLIENTE" (cliente out SYS_REFCURSOR)
IS
BEGIN
    OPEN cliente for SELECT * FROM cliente;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_LISTAR_DEPARTAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_LISTAR_DEPARTAMENTO" (departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN departamento for SELECT * FROM departamento;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_LISTAR_DEPARTAMENTO_ADMIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_LISTAR_DEPARTAMENTO_ADMIN" (departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN departamento for select d.nom_depto as "NOMBRE DEPARTAMENTO", d.desc_depto as "DESCRIPCIÓN", d.direccion, d.cant_habitacion as "HABITACIONES", d.cant_banio as "CANTIDAD BAÑOS", d.calefaccion, d.internet, 
    d.amoblado, d.television, d.disponible, d.valor_dia as "VALOR", c.nom_comuna as "COMUNA"
    from departamento d, comuna c
    where d.comuna_id_comuna = c.id_comuna;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_LISTAR_MTTODEPARTAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_LISTAR_MTTODEPARTAMENTO" (mtto_departamento out SYS_REFCURSOR)
IS
BEGIN
    OPEN mtto_departamento for SELECT * FROM mtto_departamento;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_LISTAR_RESERVA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_LISTAR_RESERVA" (reserva out SYS_REFCURSOR)
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

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_LISTAR_USUARIO" (usuario out SYS_REFCURSOR)
IS
BEGIN
    OPEN usuario for SELECT * FROM usuario;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_LISTAR_USUARIO_ADMIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_LISTAR_USUARIO_ADMIN" (usuario out SYS_REFCURSOR)
IS
BEGIN
    OPEN usuario for select u.nom_usuario, u.correo_usuario,tu.tipo_usuario,
    CASE when u.estado_usuario = 1 then 'Habilitado' else 'Deshabilitado' END "ESTADO_USUARIO"
    from usuario u, tipo_usuario tu
    where u.tipo_usuario_id_tipo_usuario = tu.id_tipo_usuario;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_MODIFICAR_CLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_MODIFICAR_CLIENTE" (id NUMBER,
v_rut_cliente VARCHAR, 
v_nom_cliente VARCHAR, 
v_apellido_paterno VARCHAR, 
v_apellido_materno VARCHAR, 
v_edad NUMBER, 
v_nacionalidad VARCHAR, 
v_genero VARCHAR, 
v_direccion_cliente VARCHAR, 
v_telefono NUMBER, 
v_email VARCHAR, 
v_usuario_id_usuario NUMBER, 

respuesta out number)
IS
BEGIN
    update cliente set 
    RUT_CLIENTE = v_rut_cliente,
    NOM_CLIENTE = v_nom_cliente,
    APELLIDO_PATERNO = v_apellido_paterno,
    APELLIDO_MATERNO = v_apellido_materno,
    EDAD = v_edad,
    NACIONALIDAD = v_nacionalidad,
    GENERO = v_genero,
    DIRECCION_CLIENTE = v_direccion_cliente,
    TELEFONO = v_telefono,
    EMAIL = v_email,
    USUARIO_ID_USUARIO = v_usuario_id_usuario

    WHERE id_cliente = id;
    respuesta := 1;
EXCEPTION
    WHEN OTHERS THEN
        respuesta := 0;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_MODIFICAR_DEPARTAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_MODIFICAR_DEPARTAMENTO" (id number,
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
--  DDL for Procedure SP_MODIFICAR_MTTODEPARTAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_MODIFICAR_MTTODEPARTAMENTO" (id NUMBER,
v_fecha_ingreso DATE, 
v_fecha_salida DATE, 
v_descripcion_mtto VARCHAR2, 
v_disponibilidad VARCHAR2,
v_departamento_id_departamento NUMBER, 

respuesta out number)
IS
BEGIN
    update mtto_departamento set 
    FECHA_INGRESO = v_fecha_ingreso,
    FECHA_SALIDA = v_fecha_salida,
    DESCRIPCION_MTTO = v_descripcion_mtto,
    DISPONIBILIDAD = v_disponibilidad,
    DEPARTAMENTO_ID_DEPARTAMENTO = v_departamento_id_departamento
    WHERE id_mtto = id;
    respuesta := 1;
EXCEPTION
    WHEN OTHERS THEN
        respuesta := 0;
END;

/
--------------------------------------------------------
--  DDL for Procedure SP_MODIFICAR_RESERVA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_MODIFICAR_RESERVA" (id NUMBER,v_fecha_ingreso DATE, v_fecha_salida DATE, v_cant_dia_reserva NUMBER, v_estado_reserva CHAR, v_fecha_estado_reserva DATE, v_departamento_id_departamento NUMBER, v_usuario_id_usuario NUMBER, respuesta out number)
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

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "C##TREAL1"."SP_MODIFICAR_USUARIO" (id NUMBER,v_nom_usuario VARCHAR, v_correo_usuario VARCHAR, v_contrasenia VARCHAR, v_estado_usuario CHAR, v_tipo_usuario_id_tipo_usuario NUMBER, respuesta out number)
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
