-- Se recomienda usar 'SET autotrace ON'
-- Antes de ejecutar las consultas para comparar los tiempos antes y despues de utilizar indices bitmap

SELECT * FROM arrendadores WHERE empleo='S' AND mascotas='N' AND hijos='N' AND estudia='S' AND genero='F';

SELECT * FROM arrendadores WHERE empleo='S' AND mascotas='N' AND hijos='N' AND estudia='S' AND genero='M';

SELECT * FROM arrendadores WHERE empleo='S' AND mascotas='N' AND hijos='N' AND estudia='N' AND genero='F';

SELECT * FROM arrendadores WHERE empleo='S' AND mascotas='N' AND hijos='N' AND estudia='N' AND genero='M';

SELECT * FROM arrendadores WHERE empleo='S' AND hijos='N' AND genero='F';

SELECT * FROM arrendadores WHERE empleo='S' AND hijos='N' AND genero='M';

-- Posterior a la corrida de prueba se crean los indices bitmap

CREATE BITMAP INDEX arrendadores_empleo_idx
ON arrendadores(empleo);

CREATE BITMAP INDEX arrendadores_mascotas_idx
ON arrendadores(mascotas);

CREATE BITMAP INDEX arrendadores_hijos_idx
ON arrendadores(hijos);

CREATE BITMAP INDEX arrendadores_estudia_idx
ON arrendadores(estudia);

CREATE BITMAP INDEX arrendadores_genero_idx
ON arrendadores(genero);

-- Al ejecutar las consultas nuevamente se pueden apreciar las mejoras en los tiempos