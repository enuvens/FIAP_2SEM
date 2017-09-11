-- JOIN --> JUN��O DE 2 OU MAIS TABELAS
-- JUN��O REGULAR, ONDE TEMOS A COMPARA��O 
-- ENTRE CHAVE PRIM�RIA E CHAVE ESTRANGEIRA.

-- JUN��O CRUZADA => CROSS JOIN => PRODUTO CARTESIANO
-- TODAS AS LINHAS DA TABELA A SE ASSOCIAM COM TODAS AS LINHAS
-- DA TABELA B E VICE-VERSA.

-- ANTES DO PADR�O SQL/99
 SELECT D.CD_DEPTO,
        D.NM_DEPTO,
        F.NR_MATRICULA,
        F.NM_FUNCIONARIO
   FROM T_SIP_DEPARTAMENTO D ,
        T_SIP_FUNCIONARIO  F;

-- PADR�O SQL/99        
 SELECT D.CD_DEPTO,
        D.NM_DEPTO,
        F.NR_MATRICULA,
        F.NM_FUNCIONARIO
   FROM T_SIP_DEPARTAMENTO D CROSS JOIN T_SIP_FUNCIONARIO F;
   
-- JUN��O INTERNA - NATURAL JOIN (O MESMO NOME E TIPO DE DADO)
-- INTERSEC��O DAS TABELAS, ONDE SER�O RECUPERADAS TODAS AS LINHAS
-- DA TABELA A, QUE SE ASSOCIAM COM LINHAS DA TABELA B, E VICE-VERSA
-- PADR�O SQL/99
 SELECT CD_DEPTO,
        D.NM_DEPTO,
        F.NR_MATRICULA,
        F.NM_FUNCIONARIO
   FROM T_SIP_DEPARTAMENTO D NATURAL JOIN T_SIP_FUNCIONARIO F;
   
-- EM UMA JUN��O NATURAL, N�O PODE UTILIZAR QUALIFICADOR
-- PARA O CAMPO/COLUNA CORRESPONDENTE A CHAVE PRIM�RIA/CHAVE ESTRANGEIRA
-- O QUALIFICADOR ALTERA O NOME DO CAMPO.

-- JUN��O INTERNA --> INNER JOIN (NOMES IGUAIS OU N�O, TIPO DE DADO
-- IGUAL OU N�O)
-- INTERSEC��O DAS TABELAS, ONDE SER�O RECUPERADAS TODAS AS LINHAS
-- DA TABELA A, QUE SE ASSOCIAM COM LINHAS DA TABELA B, E VICE-VERSA
-- A COMPARA��O ENTRE CHAVE PRIM�RIA E CHAVE ESTRANGEIRA � EXPLICITA
-- ANTES DO PADR�O SQL/99
SELECT  D.CD_DEPTO,
        D.NM_DEPTO,
        F.NR_MATRICULA,
        F.NM_FUNCIONARIO
   FROM T_SIP_DEPARTAMENTO D,
        T_SIP_FUNCIONARIO  F
  WHERE D.CD_DEPTO = F.CD_DEPTO; -- COMPARA��O ENTRE CP=CE EXPLICITA
   
-- PADR�O SQL/99
SELECT  D.CD_DEPTO,
        D.NM_DEPTO,
        F.NR_MATRICULA,
        F.NM_FUNCIONARIO
   FROM T_SIP_DEPARTAMENTO D INNER JOIN T_SIP_FUNCIONARIO F
        ON (D.CD_DEPTO = F.CD_DEPTO); -- COMPARA��O ENTRE CP=CE EXPLICITA

-- EXEMPLO CONSULTANDO 3 TABELAS
 SELECT P.CD_PROJETO,
        P.NM_PROJETO,
        I.CD_PROJETO,
        I.NR_MATRICULA,
        F.NM_FUNCIONARIO,
        I.DT_ENTRADA,
        I.DT_SAIDA
   FROM T_SIP_PROJETO P INNER JOIN T_SIP_IMPLANTACAO I
        ON (P.CD_PROJETO = I.CD_PROJETO)
        INNER JOIN T_SIP_FUNCIONARIO F
        ON (F.NR_MATRICULA = I.NR_MATRICULA) ;
   
-- JUN��O EXTERNA A ESQUERDA --> LEFT OUTER JOIN
-- RECUPERA TODAS AS LINHAS DA TABELA A ESQUERDA QUE SE ASSOCIAM OU 
-- N�O COM LINHAS DA TABELA DA DIREITA
-- PADR�O SQL/99
SELECT P.CD_PROJETO,
       P.NM_PROJETO,
       I.CD_PROJETO,
       I.DT_ENTRADA,
       I.DT_SAIDA
  FROM T_SIP_PROJETO P LEFT OUTER JOIN T_SIP_IMPLANTACAO I
       ON (P.CD_PROJETO = I.CD_PROJETO);

-- QUAIS PROJETOS N�O EST�O EM IMPLANTA��O?
SELECT P.CD_PROJETO,
       P.NM_PROJETO,
       I.CD_PROJETO,
       I.DT_ENTRADA,
       I.DT_SAIDA
  FROM T_SIP_PROJETO P LEFT OUTER JOIN T_SIP_IMPLANTACAO I
       ON (P.CD_PROJETO = I.CD_PROJETO)
 WHERE I.CD_PROJETO IS NULL; -- AVALIAR A CHAVE ESTRANGEIRA NULA

-- JUN��O EXTERNA A DIREITA --> RIGHT OUTER JOIN
-- RECUPERA TODAS AS LINHAS DA TABELA A DIREITA QUE SE ASSOCIAM OU 
-- N�O COM LINHAS DA TABELA DA ESQUERDA
-- PADR�O SQL/99
 SELECT F.NR_MATRICULA,
        F.NM_FUNCIONARIO,
        I.NR_MATRICULA,
        I.DT_ENTRADA,
        I.DT_SAIDA
   FROM T_SIP_IMPLANTACAO I RIGHT OUTER JOIN T_SIP_FUNCIONARIO F
        ON (F.NR_MATRICULA = I.NR_MATRICULA);

-- QUAIS FUNCION�RIOS N�O EST�O PARTICIPANDO DE IMPLANTA��ES?
SELECT F.NR_MATRICULA,
        F.NM_FUNCIONARIO,
        I.NR_MATRICULA,
        I.DT_ENTRADA,
        I.DT_SAIDA
   FROM T_SIP_IMPLANTACAO I RIGHT OUTER JOIN T_SIP_FUNCIONARIO F
        ON (F.NR_MATRICULA = I.NR_MATRICULA)
  WHERE I.NR_MATRICULA IS NULL; -- COMPARA A CHAVE ESTRANGEIRA NULA

   
SELECT * FROM T_SIP_FUNCIONARIO;
SELECT * FROM T_SIP_DEPARTAMENTO;