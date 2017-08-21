-- DELETANDO O CONTEÚDO DAS TABELAS --
/*
DELETE FROM T_SIP_IMPLANTACAO; 
DELETE FROM T_SIP_DEPENDENTE; 
DELETE FROM T_SIP_FUNCIONARIO; 
DELETE FROM T_SIP_PROJETO; 
DELETE FROM T_SIP_DEPARTAMENTO; 
*/


-- ALTERANDO O FORMATO DA DATA/HORA PADRÃO --
ALTER SESSION SET NLS_DATE_FORMAT = 'dd/mm/yyyy hh24:mi:ss';

-- INSERINDO DADOS NA TABELA DEPARTAMENTO
INSERT INTO T_SIP_DEPARTAMENTO (cd_depto, nm_depto) VALUES (1,'FINANCEIRO');
INSERT INTO T_SIP_DEPARTAMENTO (cd_depto, nm_depto) VALUES (2,'MARKETING');
INSERT INTO T_SIP_DEPARTAMENTO (cd_depto, nm_depto) VALUES (3,'RECURSOS HUMANOS');
INSERT INTO T_SIP_DEPARTAMENTO (cd_depto, nm_depto) VALUES (4,'COMERCIAL');
INSERT INTO T_SIP_DEPARTAMENTO (cd_depto, nm_depto) VALUES (5,'TECNOLOGIA DA INFORMAÇÃO');
-- EFETIVANDO AS TRANSAÇÕES DE INSERÇÃO NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_SIP_DEPARTAMENTO;  

-- INSERINDO DADOS NA TABELA FUNCIONARIO
INSERT INTO T_SIP_FUNCIONARIO (nr_matricula,cd_depto,nm_funcionario,dt_nascimento,dt_admissao,ds_endereco,vl_salario) 
    VALUES (1234,1,'ANA MARIA', TO_DATE('10/02/1986','DD/MM/YYYY'), TO_DATE('09/08/2010','DD/MM/YYYY'),'R. DARIO PEREIRA, 23',1234.56);
INSERT INTO T_SIP_FUNCIONARIO (nr_matricula,cd_depto,nm_funcionario,dt_nascimento,dt_admissao,ds_endereco,vl_salario) 
    VALUES (1235,2,'ROSA MARIA', TO_DATE('15/08/1970','DD/MM/YYYY'), TO_DATE('07/06/2005','DD/MM/YYYY'),'TRAV. DAS LÁGRIMAS, 34',2345.00);
INSERT INTO T_SIP_FUNCIONARIO (nr_matricula,cd_depto,nm_funcionario,dt_nascimento,dt_admissao,ds_endereco,vl_salario) 
    VALUES (3245,1,'ANTONIA CAMARGO', TO_DATE('18/07/1986','DD/MM/YYYY'), TO_DATE('11/02/2003','DD/MM/YYYY'),'PÇ. XV DE NOVEMBRO, 219',7654.99);
INSERT INTO T_SIP_FUNCIONARIO (nr_matricula,cd_depto,nm_funcionario,dt_nascimento,dt_admissao,ds_endereco,vl_salario) 
    VALUES (2233,3,'JOÃO DA SILVA', NULL, TO_DATE('08/09/2011','DD/MM/YYYY'),'AV. NAÇÕES UNIDAS, 10200', 3452.12);
INSERT INTO T_SIP_FUNCIONARIO (nr_matricula,cd_depto,nm_funcionario,dt_nascimento,dt_admissao,ds_endereco,vl_salario) 
    VALUES (7866,3,'JOAQUIM XAVIER', TO_DATE('21/04/1987','DD/MM/YYYY'), TO_DATE('05/04/2010','DD/MM/YYYY'),'R. GIL VICENTE, 45',980.00);
INSERT INTO T_SIP_FUNCIONARIO (nr_matricula,cd_depto,nm_funcionario,dt_nascimento,dt_admissao,ds_endereco,vl_salario) 
    VALUES (9876,4,'JOSÉ MARIA', TO_DATE('08/09/1998','DD/MM/YYYY'), TO_DATE('17/03/2009','DD/MM/YYYY'), 'AV. PAULISTA, 23',1789.00 );
INSERT INTO T_SIP_FUNCIONARIO (nr_matricula,cd_depto,nm_funcionario,dt_nascimento,dt_admissao,ds_endereco,vl_salario) 
    VALUES (9899,4,'JOSÉ LISBOA', TO_DATE('07/10/1996','DD/MM/YYYY'), TO_DATE('17/03/2009','DD/MM/YYYY'), 'AV. PAULISTA, 99', 1780.00 );
    
-- EFETIVANDO AS TRANSAÇÕES DE INSERÇÃO NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_SIP_FUNCIONARIO;  

-- INSERINDO DADOS NA TABELA DEPENDENTE
INSERT INTO T_SIP_DEPENDENTE (nr_matricula, cd_dependente,nm_dependente, dt_nascimento)
            VALUES (1235,1,'PEDRO DA SILVA', TO_DATE('12/01/1963','DD/MM/YYYY'));
INSERT INTO T_SIP_DEPENDENTE (nr_matricula, cd_dependente,nm_dependente, dt_nascimento)
            VALUES (3245,1,'GEORGE CAMARGO', TO_DATE('15/09/1971','DD/MM/YYYY'));
INSERT INTO T_SIP_DEPENDENTE (nr_matricula, cd_dependente,nm_dependente, dt_nascimento)
            VALUES (3245,2,'ANTONIO CAMARGO',TO_DATE('10/06/2000','DD/MM/YYYY'));
INSERT INTO T_SIP_DEPENDENTE (nr_matricula, cd_dependente,nm_dependente, dt_nascimento)
            VALUES (2233,1,'ANA DA SILVA',TO_DATE('23/04/1976','DD/MM/YYYY'));
INSERT INTO T_SIP_DEPENDENTE (nr_matricula, cd_dependente,nm_dependente, dt_nascimento)
            VALUES (2233,2,'JOANA DA SILVA',TO_DATE('16/05/2002','DD/MM/YYYY'));
INSERT INTO T_SIP_DEPENDENTE (nr_matricula, cd_dependente,nm_dependente, dt_nascimento)
            VALUES (2233,3,'JOÃO DA SILVA JUNIOR',TO_DATE('16/05/2002','DD/MM/YYYY'));            
-- EFETIVANDO AS TRANSAÇÕES DE INSERÇÃO NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_SIP_DEPENDENTE;      

-- INSERINDO DADOS NA TABELA PROJETO
INSERT INTO T_SIP_PROJETO (cd_projeto, nm_projeto, dt_inicio, dt_termino) VALUES (1,'PROJETO ABC', TO_DATE('10/01/2013','DD/MM/YYYY'), NULL);
INSERT INTO T_SIP_PROJETO (cd_projeto, nm_projeto, dt_inicio, dt_termino) VALUES (2,'PROJETO BCD', TO_DATE('28/10/2012','DD/MM/YYYY'), TO_DATE('10/03/2013','DD/MM/YYYY'));
INSERT INTO T_SIP_PROJETO (cd_projeto, nm_projeto, dt_inicio, dt_termino) VALUES (3,'PROJETO CDE', TO_DATE('09/12/2012','DD/MM/YYYY'), NULL);
INSERT INTO T_SIP_PROJETO (cd_projeto, nm_projeto, dt_inicio, dt_termino) VALUES (4,'PROJETO DEF', TO_DATE('15/12/2012','DD/MM/YYYY'), NULL);
-- EFETIVANDO AS TRANSAÇÕES DE INSERÇÃO NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_SIP_PROJETO;    

-- INSERINDO DADOS NA TABELA IMPLANTACAO
INSERT INTO T_SIP_IMPLANTACAO (cd_implantacao, cd_projeto, nr_matricula,dt_entrada,dt_saida) 
            VALUES (1,1,3245,TO_DATE('10/01/2013','DD/MM/YYYY'), NULL);
INSERT INTO T_SIP_IMPLANTACAO (cd_implantacao, cd_projeto, nr_matricula,dt_entrada,dt_saida) 
            VALUES (2,2,3245,TO_DATE('28/10/2012','DD/MM/YYYY'),TO_DATE('10/03/2013','DD/MM/YYYY'));
INSERT INTO T_SIP_IMPLANTACAO (cd_implantacao, cd_projeto, nr_matricula,dt_entrada,dt_saida) 
            VALUES (3,3,2233,TO_DATE('09/12/2012','DD/MM/YYYY'),NULL);
INSERT INTO T_SIP_IMPLANTACAO (cd_implantacao, cd_projeto, nr_matricula,dt_entrada,dt_saida) 
            VALUES (4,3,7866,TO_DATE('15/01/2013','DD/MM/YYYY'),NULL);            
-- EFETIVANDO AS TRANSAÇÕES DE INSERÇÃO NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_SIP_IMPLANTACAO; 

 

