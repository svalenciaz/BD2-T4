DROP TABLE NUMERO;

ALTER SYSTEM flush buffer_cache;
ALTER SYSTEM flush shared_pool;

CREATE TABLE numero(
m NUMBER(8) CHECK(m>0),
n NUMBER(8) CHECK(n>0),
p NUMBER(8) CHECK(p>0),
q NUMBER(8) CHECK(q>0),
PRIMARY KEY(m, n, p, q)
);
