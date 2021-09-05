/*
Accediendo con:
conn sys as sysdba

Generamos los siguientes permisos para el respectivo username:
*/
GRANT SELECT ON v_$parameter TO <username>;
GRANT SELECT ON v_$process TO <username>;
GRANT SELECT ON v_$session TO <username>;
GRANT ALTER SYSTEM TO <username>;
GRANT ALTER SESSION TO <username>;

SELECT value FROM v$parameter WHERE name = 'timed_statistics';
ALTER SESSION SET TIMED_STATISTICS=TRUE;
ALTER SESSION SET SQL_TRACE = TRUE;

SELECT value AS ruta_d
FROM v$parameter
WHERE name = 'user_dump_dest';

SELECT spid FROM sys.v_$process
WHERE addr = (SELECT paddr FROM sys.v_$session
                WHERE audsid = USERENV('sessionid')
);

ALTER SYSTEM flush buffer_cache;
ALTER SYSTEM flush shared_pool;

SET AUTOTRACE ON;