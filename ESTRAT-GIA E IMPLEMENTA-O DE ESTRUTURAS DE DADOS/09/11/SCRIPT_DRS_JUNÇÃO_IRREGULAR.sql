CREATE TABLE T_SCC_CATEG_PRECO(
CD_CATEGORIA  NUMBER(2) NOT NULL,
NM_CATEGORIA  VARCHAR(30) NOT NULL,
VL_PRECO_INICIAL  NUMBER(5,2) NOT NULL,
VL_PRECO_FINAL  NUMBER(5,2) NOT NULL
);

ALTER TABLE T_SCC_CATEG_PRECO ADD CONSTRAINT PK_SCC_CATEG_PRECO PRIMARY KEY (CD_CATEGORIA);

CREATE TABLE T_SCC_CD (
  CD_CD NUMBER(3) NOT NULL,
  NM_CD VARCHAR(30) NOT NULL,
  VL_PRECO_VENDA  NUMBER(5,2) NOT NULL
);

ALTER TABLE T_SCC_CD ADD CONSTRAINT PK_SCC_CD PRIMARY KEY (CD_CD);

INSERT INTO T_SCC_CATEG_PRECO (CD_CATEGORIA, NM_CATEGORIA, VL_PRECO_INICIAL, VL_PRECO_FINAL) VALUES (1,'FAIXA VERDE', 5.00, 15.99);
INSERT INTO T_SCC_CATEG_PRECO (CD_CATEGORIA, NM_CATEGORIA, VL_PRECO_INICIAL, VL_PRECO_FINAL) VALUES (2,'FAIXA AMARELA', 16.00, 35.99);
INSERT INTO T_SCC_CATEG_PRECO (CD_CATEGORIA, NM_CATEGORIA, VL_PRECO_INICIAL, VL_PRECO_FINAL) VALUES (3,'FAIXA VERMELHA', 36.00, 65.99);
INSERT INTO T_SCC_CATEG_PRECO (CD_CATEGORIA, NM_CATEGORIA, VL_PRECO_INICIAL, VL_PRECO_FINAL) VALUES (4,'FAIXA PRETA', 66.00, 100.00);
INSERT INTO T_SCC_CATEG_PRECO (CD_CATEGORIA, NM_CATEGORIA, VL_PRECO_INICIAL, VL_PRECO_FINAL) VALUES (5,'FAIXA MARROM', 100.01, 999.00);
COMMIT; 

SELECT * FROM T_SCC_CATEG_PRECO;

INSERT INTO T_SCC_CD VALUES (1, 'CD ABC', 9.99);
INSERT INTO T_SCC_CD VALUES (2, 'CD DEF', 19.99);
INSERT INTO T_SCC_CD VALUES (3, 'CD GHI', 41);
INSERT INTO T_SCC_CD VALUES (4, 'CD KLM', 69);
INSERT INTO T_SCC_CD VALUES (5, 'CD NOP', 55.22);
INSERT INTO T_SCC_CD VALUES (6, 'CD QRS', 105.22);
COMMIT;

SELECT 
A.CD_CD,
A.NM_CD,
A.VL_PRECO_VENDA,
B.NM_CATEGORIA,
B.VL_PRECO_INICIAL,
B.VL_PRECO_FINAL
FROM T_SCC_CD A, T_SCC_CATEG_PRECO B
WHERE
  A.VL_PRECO_VENDA BETWEEN B.VL_PRECO_INICIAL AND B.VL_PRECO_FINAL;

