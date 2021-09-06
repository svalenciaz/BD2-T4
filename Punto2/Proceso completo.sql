DROP TABLE NUMERO;

CREATE TABLE numero(
m NUMBER(8) CHECK(m>0),
n NUMBER(8) CHECK(n>0),
p NUMBER(8) CHECK(p>0),
q NUMBER(8) CHECK(q>0),
PRIMARY KEY(m, n, p, q)
);

ALTER SYSTEM flush buffer_cache;
ALTER SYSTEM flush shared_pool;


BEGIN
    datos_punto_dos(2000000);
END;
/

ALTER SESSION SET TIMED_STATISTICS=TRUE;
ALTER SESSION SET SQL_TRACE = TRUE;

SELECT value AS ruta_d
FROM v$parameter
WHERE name = 'user_dump_dest';

SELECT spid FROM sys.v_$process
WHERE addr = (SELECT paddr FROM sys.v_$session
                WHERE audsid = USERENV('sessionid')
);

SET AUTOTRACE ON;

ALTER SYSTEM flush buffer_cache;
ALTER SYSTEM flush shared_pool;

SELECT m*n/p*q AS res
FROM numero;

ALTER SYSTEM flush buffer_cache;
ALTER SYSTEM flush shared_pool;

SELECT LN(m)*LN(n)/LN(p)*LN(q) AS res
FROM numero;