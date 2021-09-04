CREATE OR REPLACE PROCEDURE numeros_aleatorios
IS
    primero NUMBER(8):= DBMS_RANDOM.VALUE(1, 99999999);
    segundo NUMBER(8):= DBMS_RANDOM.VALUE(1, 99999999);
    tercero NUMBER(8):= DBMS_RANDOM.VALUE(1, 99999999);
    cuarto NUMBER(8):= DBMS_RANDOM.VALUE(1, 99999999);
BEGIN
    INSERT INTO NUMERO VALUES (primero, segundo, tercero, cuarto);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error ejecutando script ' || SQLERRM || '. Código: ' || sqlcode);
        numeros_aleatorios();
end;
/

CREATE OR REPLACE PROCEDURE datos_punto_dos(
numeros IN NUMERO.M%TYPE
)
IS

BEGIN
    DELETE NUMERO;
    COMMIT;

    FOR nuevos_numeros IN 1 .. numeros LOOP
        numeros_aleatorios();
    END LOOP;
    COMMIT;

END;
/