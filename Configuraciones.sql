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

/*
Ingresar con el usuario al que se le dio los permisos y ejecutar
antes de empezar la exploración de las consultas
*/
SELECT value FROM v$parameter WHERE name = 'timed_statistics';
ALTER SESSION SET TIMED_STATISTICS=TRUE;
ALTER SESSION SET SQL_TRACE = TRUE;

/*
Indica la ruta dónde se encuentra el archivo que se debe analizar
para implementar el TKPROF
*/
SELECT value AS ruta_d
FROM v$parameter
WHERE name = 'user_dump_dest';

/*
Guardar el id que suelte esta consulta para hacer el TKPROF
*/
SELECT spid FROM sys.v_$process
WHERE addr = (SELECT paddr FROM sys.v_$session
                WHERE audsid = USERENV('sessionid')
);

/*
Borra el caché
*/
ALTER SYSTEM flush buffer_cache;
ALTER SYSTEM flush shared_pool;

/*
Enciende el Explain Plan automático
*/
SET AUTOTRACE ON;