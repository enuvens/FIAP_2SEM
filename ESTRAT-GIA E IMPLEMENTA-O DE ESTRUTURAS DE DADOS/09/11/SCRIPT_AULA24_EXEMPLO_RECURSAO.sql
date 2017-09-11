------------------------------------------
-- EXEMPLO DE AÇÃO REFERENCIAL SET NULL --
------------------------------------------

-- DROP TABLE T_AULA16_2_FUNCIONARIO CASCADE CONSTRAINT;

CREATE TABLE T_AULA16_2_FUNCIONARIO 
    ( 
     matricula  NUMBER (5)    NOT NULL , 
     cod_depto  NUMBER (4)    NOT NULL , 
     cod_cargo  NUMBER (4)    NOT NULL , 
     Gerente    NUMBER (5)        NULL , 
     nome       VARCHAR2 (60) NOT NULL , 
     cpf        NUMBER (11)   NOT NULL , 
     RG         CHAR (10)     NOT NULL 
    ) ;
/* Chave primária da tabela Funcionario */
ALTER TABLE T_AULA16_2_FUNCIONARIO 
    ADD CONSTRAINT T_AULA16_2_FUNCIONARIO_PK PRIMARY KEY ( matricula ) ;

/******* Chave ESTRANGEIRA - Tabela Funcionario ********/
ALTER TABLE T_AULA16_2_FUNCIONARIO 
    ADD CONSTRAINT FK_AULA16_2_GERENTE FOREIGN KEY (Gerente) 
          REFERENCES T_AULA16_2_FUNCIONARIO (matricula) 
          ON DELETE SET NULL ;

---------------------------------------------------
-- EXEMPLO DE INSERÇÕES
----------------------------------------------------
INSERT INTO  T_AULA16_2_FUNCIONARIO 
  (matricula, cod_depto, cod_cargo, nome, cpf, RG)
VALUES   (1, 1, 1,'RITA',12345678901,'11222333X');
INSERT INTO  T_AULA16_2_FUNCIONARIO 
  (matricula, cod_depto, cod_cargo, nome, cpf, RG)
VALUES   (2, 1, 1,'JOAO',12342233445,'11333444X');
INSERT INTO  T_AULA16_2_FUNCIONARIO 
  (matricula, cod_depto, cod_cargo, nome, cpf, RG)
VALUES   (3, 1, 1,'ROSA',12234543441,'11444555X');
INSERT INTO  T_AULA16_2_FUNCIONARIO 
  (matricula, cod_depto, cod_cargo, nome, cpf, RG)
VALUES   (4, 1, 1,'MARIA',1555566651,'116667778');
INSERT INTO  T_AULA16_2_FUNCIONARIO 
  (matricula, cod_depto, cod_cargo, nome, cpf, RG)
VALUES   (5, 1, 1,'ANA'  ,1343322901,'119764333');

--------------------------------------------------

UPDATE T_AULA16_2_FUNCIONARIO
SET GERENTE=3
WHERE MATRICULA IN (1,2,5);

/*
-- EXEMPLO DE DELEÇÃO
DELETE T_AULA16_2_FUNCIONARIO WHERE MATRICULA = 3;
*/


COMMIT;
SELECT * FROM T_AULA16_2_FUNCIONARIO ;

SELECT
FUNC.MATRICULA,
FUNC.NOME "FUNCIONARIO",
FUNC.GERENTE "COD. GERENTE",
GERE.NOME "GERENTE"
FROM 
T_AULA16_2_FUNCIONARIO FUNC INNER JOIN T_AULA16_2_FUNCIONARIO GERE ON (GERE.MATRICULA = FUNC.GERENTE)
ORDER BY GERE.MATRICULA;
