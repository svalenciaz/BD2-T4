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

--CREATE INDEX faccedidx ON factura(cecliente);
--CREATE INDEX detfacidx ON detalle(codfact);

BEGIN
    datos_punto_uno(15000, 100000, 480000);
END;
/

ALTER SYSTEM flush buffer_cache;
ALTER SYSTEM flush shared_pool;