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