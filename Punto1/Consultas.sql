SELECT *
FROM cliente c, factura f, detalle d
WHERE c.cedula = f.cecliente AND f.codigof = d.codfact;

SELECT /*+ FULL(c) FULL(f) FULL(d)  */ *
FROM cliente c, factura f, detalle d
WHERE c.cedula = f.cecliente AND f.codigof = d.codfact;

SELECT /*+ USE_MERGE(c f) USE_MERGE(d)  */ *
FROM cliente c, factura f, detalle d
WHERE c.cedula = f.cecliente AND f.codigof = d.codfact;

CREATE INDEX faccedidx ON factura(cecliente);
CREATE INDEX detfacidx ON detalle(codfact);
SELECT *
FROM cliente c, factura f, detalle d
WHERE c.cedula = f.cecliente AND f.codigof = d.codfact;
