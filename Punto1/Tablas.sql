DROP TABLE DETALLE;
DROP TABLE FACTURA;
DROP TABLE CLIENTE;

ALTER SYSTEM flush buffer_cache;
ALTER SYSTEM flush shared_pool;


CREATE TABLE cliente(
cedula NUMBER(20) PRIMARY KEY,
nombre VARCHAR2(100) NOT NULL,
telefono NUMBER(20) NOT NULL
);

CREATE TABLE factura(
codigof NUMBER(20) PRIMARY KEY,
fecha DATE NOT NULL,
cecliente NUMBER(20) NOT NULL REFERENCES cliente
);

CREATE TABLE detalle(
codigod NUMBER(20) PRIMARY KEY,
codproducto NUMBER(20) NOT NULL,
nro_unidades NUMBER(20) NOT NULL,
valor_unitario NUMBER(20) NOT NULL,
codfact NUMBER(20) NOT NULL REFERENCES factura
);

BEGIN
    datos_punto_uno(100, 1000, 5000);
END;
/

SELECT value AS ruta_d
FROM v$parameter
WHERE name = 'user_dump_dest';

SELECT spid FROM sys.v_$process
WHERE addr = (SELECT paddr FROM sys.v_$session
                WHERE audsid = USERENV('sessionid')
);

