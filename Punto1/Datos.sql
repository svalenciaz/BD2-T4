CREATE OR REPLACE PROCEDURE datos_punto_uno(
clientes IN CLIENTE.CEDULA%TYPE,
facturas IN FACTURA.CODIGOF%TYPE,
detalles IN DETALLE.CODIGOd%TYPE
)
IS

BEGIN
    DELETE DETALLE;
    DELETE FACTURA;
    DELETE CLIENTE;
    COMMIT;

    FOR nueva_cedula IN 1 .. clientes LOOP
        INSERT INTO CLIENTE VALUES (
                                    nueva_cedula,
                                    DBMS_RANDOM.STRING('A', 20),
                                    DBMS_RANDOM.VALUE(1000000,9999999)
                                   );
    END LOOP;
    COMMIT;

    FOR nuevo_codigof IN 1 .. facturas LOOP
        INSERT INTO FACTURA VALUES (
                                    nuevo_codigof,
                                    SYSDATE+DBMS_RANDOM.VALUE(-720, 0),
                                    DBMS_RANDOM.VALUE(1, clientes)
                                   );
    end loop;
    COMMIT;

    FOR nuevo_codigod IN 1 .. detalles LOOP
        INSERT INTO DETALLE VALUES (
                                    nuevo_codigod,
                                    DBMS_RANDOM.VALUE(1000, 9999),
                                    DBMS_RANDOM.VALUE(1, 10000),
                                    DBMS_RANDOM.VALUE(10000, 100000000),
                                    DBMS_RANDOM.VALUE(1, facturas)
                                   );
    end loop;
    COMMIT;

END;
/

--BEGIN
--    datos_punto_uno(3, 9, 27);
--end;
--/