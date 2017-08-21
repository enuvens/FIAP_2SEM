-------------------------------------------------------
--  AULA 22 - EXEMPLOS DE COMANDO INSERT
-------------------------------------------------------
-- ALTERAR O FORMATO DE DATA E HORA DESTA SESSAO
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH:MI';

--1) Retorna todas as colunas e registros da tabela FUNCIONARIO:
SELECT * FROM T_SIP_FUNCIONARIO;

--2) Retorna as colunas especificadas e todos os registros da tabela FUNCIONARIO :
SELECT     NR_MATRICULA ,
               CD_DEPTO ,
            DT_ADMISSAO ,
             VL_SALARIO
  FROM  T_SIP_FUNCIONARIO;

-- 3) Retorna as colunas especificadas e todos os registros da tabela �FUNCIONARIO�, conforme a condi��o especificada:
SELECT     NR_MATRICULA ,
               CD_DEPTO ,
            DT_ADMISSAO ,
             VL_SALARIO
  FROM  T_SIP_FUNCIONARIO
 WHERE CD_DEPTO=3;

-- 4) Exemplo utilizando DISTINCT

SELECT CD_DEPTO FROM T_SIP_FUNCIONARIO; 

SELECT DISTINCT CD_DEPTO FROM T_SIP_FUNCIONARIO; 

--5)Exemplo utilizando DISTINCT
SELECT CD_DEPTO, DT_ADMISSAO FROM T_SIP_FUNCIONARIO; 

SELECT DISTINCT CD_DEPTO, DT_ADMISSAO FROM T_SIP_FUNCIONARIO;

-- EXEMPLOS COM OPERADORES RELACIONAIS
-- FILTRANDO POR N�MEROS
SELECT NR_MATRICULA, NM_FUNCIONARIO, VL_SALARIO
  FROM T_SIP_FUNCIONARIO
 WHERE VL_SALARIO > 1500.50;

-- FILTRANTO POR TEXTO
SELECT NR_MATRICULA, NM_FUNCIONARIO
  FROM T_SIP_FUNCIONARIO 
 WHERE NM_FUNCIONARIO='ROSA MARIA'; 
 
SELECT NR_MATRICULA, NM_FUNCIONARIO
  FROM T_SIP_FUNCIONARIO 
 WHERE UPPER(NM_FUNCIONARIO)='ROSA MARIA'; 

SELECT NR_MATRICULA, NM_FUNCIONARIO
  FROM T_SIP_FUNCIONARIO 
 WHERE LOWER(NM_FUNCIONARIO)='rosa maria'; 

-- FILTRANDO POR DATA
SELECT NR_MATRICULA, NM_FUNCIONARIO, DT_ADMISSAO
  FROM T_SIP_FUNCIONARIO
 WHERE DT_ADMISSAO > TO_DATE('01/08/2010','DD/MM/YYYY');
 
-- EXEMPLOS COM OPERADORES L�GICOS
-- OPERADOR AND
SELECT NR_MATRICULA, NM_FUNCIONARIO,CD_DEPTO, DT_ADMISSAO
FROM   T_SIP_FUNCIONARIO
WHERE  DT_ADMISSAO > TO_DATE('01/08/2010','DD/MM/YYYY') AND
      CD_DEPTO=3;
       
-- OPERADOR OR
SELECT NR_MATRICULA, NM_FUNCIONARIO,CD_DEPTO, VL_SALARIO 
FROM   T_SIP_FUNCIONARIO 
WHERE CD_DEPTO=4 OR
       VL_SALARIO>3000; 
       
-- OPERADOR NOT
SELECT NR_MATRICULA, NM_FUNCIONARIO,CD_DEPTO, VL_SALARIO 
FROM   T_SIP_FUNCIONARIO 
WHERE  NOT CD_DEPTO=4;

-- UTILIZANDO V�RIOS OPERADORES
SELECT NR_MATRICULA, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, DT_ADMISSAO, VL_SALARIO
  FROM T_SIP_FUNCIONARIO
 WHERE 
        DT_NASCIMENTO BETWEEN TO_DATE('01/01/1970','DD/MM/YYYY')  AND
                              TO_DATE('30/12/1996','DD/MM/YYYY')  AND
                DT_ADMISSAO > TO_DATE('01/01/2009','DD/MM/YYYY')  AND
                VL_SALARIO < 1500 AND
                NOT CD_DEPTO=3;                                  
                              
                              

-- EXEMPLOS DE OPERADORES ESPECIAIS
-- OPERADOR BETWEEN
SELECT NR_MATRICULA, NM_FUNCIONARIO, CD_DEPTO, VL_SALARIO  
FROM   T_SIP_FUNCIONARIO 
WHERE  VL_SALARIO BETWEEN 600 AND 1200;

SELECT NR_MATRICULA, NM_FUNCIONARIO, CD_DEPTO, DT_ADMISSAO  
FROM   T_SIP_FUNCIONARIO 
WHERE  DT_ADMISSAO BETWEEN TO_DATE('01/01/2011','DD/MM/YYYY') AND TO_DATE('30/12/2011','DD/MM/YYYY');

SELECT NR_MATRICULA, NM_FUNCIONARIO, CD_DEPTO, DT_ADMISSAO  
FROM   T_SIP_FUNCIONARIO 
WHERE  NM_FUNCIONARIO BETWEEN 'JO' AND 'ROSE';

SELECT NR_MATRICULA, NM_FUNCIONARIO, CD_DEPTO, DT_ADMISSAO  
FROM   T_SIP_FUNCIONARIO 
WHERE  NM_FUNCIONARIO BETWEEN 'ANT' AND 'JOS';

-- OPERADOR IN
SELECT NR_MATRICULA, NM_FUNCIONARIO, CD_DEPTO
FROM   T_SIP_FUNCIONARIO
WHERE CD_DEPTO IN (1,2,3);

-- OPERADOR NOT IN
SELECT NR_MATRICULA, NM_FUNCIONARIO, CD_DEPTO
FROM   T_SIP_FUNCIONARIO
WHERE CD_DEPTO NOT IN (1,2,3);

-- OPERADOR IN
SELECT      NR_MATRICULA ,      
             DT_ADMISSAO ,
              VL_SALARIO 
FROM    T_SIP_FUNCIONARIO
WHERE  TO_CHAR(DT_ADMISSAO,'YYYY') IN ('2010', '2011');


-- OPERADOR IS NOT NULL
SELECT NR_MATRICULA, NM_FUNCIONARIO, DT_NASCIMENTO
FROM   T_SIP_FUNCIONARIO
WHERE  DT_NASCIMENTO IS NOT NULL;

-- OPERADOR IS NULL
SELECT NR_MATRICULA, NM_FUNCIONARIO, DT_NASCIMENTO
FROM   T_SIP_FUNCIONARIO
WHERE  DT_NASCIMENTO IS  NULL;

-- OPERADOR LIKE
SELECT CD_DEPTO, NM_DEPTO
FROM   T_SIP_DEPARTAMENTO
WHERE  NM_DEPTO LIKE 'FINA%';

SELECT CD_DEPTO, NM_DEPTO
FROM   T_SIP_DEPARTAMENTO
WHERE  NM_DEPTO LIKE '_A%';

SELECT CD_DEPTO, NM_DEPTO
FROM   T_SIP_DEPARTAMENTO
WHERE  NM_DEPTO LIKE '___UR%';

SELECT CD_DEPTO, NM_DEPTO
FROM   T_SIP_DEPARTAMENTO
WHERE  NM_DEPTO LIKE '%MER%';

SELECT CD_DEPTO, NM_DEPTO
FROM   T_SIP_DEPARTAMENTO
WHERE  NM_DEPTO LIKE '__MER';

SELECT CD_DEPTO, NM_DEPTO
FROM   T_SIP_DEPARTAMENTO
WHERE  NM_DEPTO LIKE 'FI_';

-- EXEMPLO DA CLAUSULA ORDER BY
-- ORDER BY ASC
SELECT CD_DEPTO, NM_DEPTO
FROM   T_SIP_DEPARTAMENTO
ORDER BY NM_DEPTO;

-- ORDER BY DESC
SELECT CD_DEPTO, NM_DEPTO
FROM   T_SIP_DEPARTAMENTO
ORDER BY NM_DEPTO DESC;

-- ORDER BY ASC E DESC
SELECT NR_MATRICULA,CD_DEPTO, NM_FUNCIONARIO, VL_SALARIO  
FROM   T_SIP_FUNCIONARIO 
WHERE CD_DEPTO >1
ORDER BY CD_DEPTO ASC, NM_FUNCIONARIO ASC, VL_SALARIO DESC;

-- ORDER BY UTILIZANDO NUMEROS QUE REPRESENTAM AS COLUNAS
SELECT NR_MATRICULA,CD_DEPTO, NM_FUNCIONARIO, VL_SALARIO  
FROM   T_SIP_FUNCIONARIO 
WHERE  CD_DEPTO >1
ORDER BY 2 ASC, 3 ASC, 4 DESC;

-- QUALIFICADORES DE NOME
SELECT T_SIP_DEPARTAMENTO.NM_DEPTO
  FROM T_SIP_DEPARTAMENTO;
  
SELECT T_SIP_FUNCIONARIO.NR_MATRICULA ,
       T_SIP_FUNCIONARIO.CD_DEPTO ,
       T_SIP_FUNCIONARIO.DT_ADMISSAO ,
       T_SIP_FUNCIONARIO.VL_SALARIO
  FROM T_SIP_FUNCIONARIO;

-- ALIAS (APELIDO) PARA COLUNAS
SELECT     NR_MATRICULA AS MATRICULA ,
           CD_DEPTO       DEPARTAMENTO,
           DT_ADMISSAO    "DATA ADMISS�O",
           VL_SALARIO     SALARIO
  FROM T_SIP_FUNCIONARIO;

-- APELIDOS PARA TABELAS
SELECT FUNC.NR_MATRICULA ,
       FUNC.CD_DEPTO ,
       FUNC.DT_ADMISSAO ,
       FUNC.VL_SALARIO
  FROM T_SIP_FUNCIONARIO FUNC;

-- EXEMPLO COM SUBQUERY
SELECT    NR_MATRICULA ,
              CD_DEPTO ,
           DT_ADMISSAO ,
            VL_SALARIO
FROM   T_SIP_FUNCIONARIO
WHERE CD_DEPTO IN
        ( SELECT CD_DEPTO
          FROM   T_SIP_DEPARTAMENTO
          WHERE  UPPER(NM_DEPTO) LIKE '%MER%'
        );

--  EXEMPLO DE CONSULTA COM COLUNAS CALCULADAS
-- CALCULAR O SAL�RIO ANUAL DE UM FUNCIONARIO E EXIBIR ATRAV�S DA CONSULTA
SELECT    NR_MATRICULA ,
              CD_DEPTO ,
           DT_ADMISSAO ,
            VL_SALARIO ,
      (VL_SALARIO * 12) "SAL�RIO ANUAL"
FROM   T_SIP_FUNCIONARIO;


SELECT    NR_MATRICULA ,
              CD_DEPTO ,
           DT_ADMISSAO ,
            VL_SALARIO ,
      (VL_SALARIO * 12) "SAL�RIO ANUAL"
FROM   T_SIP_FUNCIONARIO
WHERE CD_DEPTO > 1
ORDER BY "SAL�RIO ANUAL" DESC;

-- EXEMPLO DE COLUNAS CONCATENADAS
-- EXIBIR O TEXTO: "O FUNCIONARIO <NOME> FOI ADMITIDO EM <DATA ADMISSAO>"
SELECT    NR_MATRICULA ,
          'O FUNCIONARIO ' || NM_FUNCIONARIO || ',  FOI ADMITIDO EM  ' || DT_ADMISSAO       
FROM   T_SIP_FUNCIONARIO;

-- EXEMPLO ROWNUM
SELECT ROWNUM, 
       CD_DEPTO, 
       NM_DEPTO
FROM   T_SIP_DEPARTAMENTO;

SELECT    NR_MATRICULA ,
          CD_DEPTO ,
          DT_ADMISSAO ,
          VL_SALARIO ,
      (VL_SALARIO * 12) "SAL�RIO ANUAL"
FROM   T_SIP_FUNCIONARIO
WHERE  ROWNUM <4 ;
       
SELECT    NR_MATRICULA ,
          CD_DEPTO ,
          DT_ADMISSAO ,
          VL_SALARIO ,
      (VL_SALARIO * 12) "SAL�RIO ANUAL"
FROM   T_SIP_FUNCIONARIO
WHERE  ROWNUM <4 AND
      CD_DEPTO <> 2;       

-- PARA EXIBIR OS NOMES E OS SAL�RIOS DOS TR�S FUNCION�RIOS
-- MAIS BEM REMUNERADOS DA TABELA FUNCIONARIO.
SELECT  ROWNUM as RANK , 
               NM_FUNCIONARIO , 
               VL_SALARIO
FROM 
    (    SELECT NM_FUNCIONARIO ,
                VL_SALARIO
           FROM T_SIP_FUNCIONARIO
       ORDER BY VL_SALARIO DESC
    )
WHERE ROWNUM <= 3 ;


SELECT  ROWNUM as RANK , 
               NM_FUNCIONARIO , 
               VL_SALARIO
FROM 
    (    SELECT NM_FUNCIONARIO ,
                VL_SALARIO
           FROM T_SIP_FUNCIONARIO
       ORDER BY VL_SALARIO DESC
    )
WHERE ROWNUM <= 3 AND 
      VL_SALARIO>2000;




