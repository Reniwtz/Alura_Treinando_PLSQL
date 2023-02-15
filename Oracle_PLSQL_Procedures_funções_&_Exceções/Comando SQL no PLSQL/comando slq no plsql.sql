--1) No Oracle SQL Developer, crie um novo script com a conexão CURSO PLSQL.

--2) Execute o comando INSERT:

INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (1, 'Varejo');
--Você receberá um erro.

--3) Crie um novo script com a conexão CONEXÃO MÁQUINA LOCAL e execute o seguinte comando:

ALTER USER cursoplsql QUOTA UNLIMITED ON USERS;
--4) Volte ao script com a conexão CURSO PLSQL e mostre o conteúdo da tabela SEGMERCADO:

SELECT * FROM SEGMERCADO;COPIAR CÓDIGO
--5) Crie um programa para inserir dados na tabela, executando o seguinte código:

DECLARE
   v_ID NUMBER(5) := 2;
   v_DESCRICAO VARCHAR2(100) := 'Industria';
BEGIN
   INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_ID, v_DESCRICAO);
COMMIT;
END;

--6) Utilize o comando %type:

DECLARE
   v_ID SEGMERCADO.ID%type := 3;
   v_DESCRICAO SEGMERCADO.DESCRICAO%type := 'Atacado';
BEGIN
   INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_ID, v_DESCRICAO);
COMMIT;
END;

--7) Exiba o conteúdo da tabela SEGMERCADO:

SELECT * FROM SEGMERCADO;

--8) Crie um script novo, usando a conexão CURSO PLSQL.

--9) Mostre o conteúdo de SEGMERCADO, usando as opções da palavra atacado, com as seleções:

SELECT * FROM SEGMERCADO;
SELECT * FROM SEGMERCADO WHERE DESCRICAO = 'Atacado';
SELECT * FROM SEGMERCADO WHERE DESCRICAO = 'atacado';

--10) Use a função UPPER:

SELECT * FROM SEGMERCADO WHERE UPPER(DESCRICAO) = 'ATACADO';

--11) Faça o programa, executando os códigos:

DECLARE
   v_ID SEGMERCADO.ID%type := 4;
   v_DESCRICAO SEGMERCADO.DESCRICAO%type := 'Atacado';
BEGIN
   INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_ID, UPPER(v_DESCRICAO));
   COMMIT;
END;

--12) Apague o registro onde o ID é 4:

DELETE FROM SEGMERCADO WHERE ID = 4;

--13) Crie um novo script vazio.

--14) Mostre o conteúdo da tabela SEGMERCADO:

SELECT * FROM SEGMERCADO;

--15) Use o comando UPDATE para alterar a tabela:

DECLARE
   v_ID SEGMERCADO.ID%type := 3;
   v_DESCRICAO SEGMERCADO.DESCRICAO%type := 'Atacadista';
BEGIN
   UPDATE SEGMERCADO SET DESCRICAO = UPPER(v_DESCRICAO) WHERE ID = v_ID;
   v_ID := 1;
   v_DESCRICAO := 'Varejista';
   UPDATE SEGMERCADO SET DESCRICAO = UPPER(v_DESCRICAO) WHERE ID = v_ID;
   v_ID := 2;
   v_DESCRICAO := 'Industrial';
   UPDATE SEGMERCADO SET DESCRICAO = UPPER(v_DESCRICAO) WHERE ID = v_ID;
   COMMIT;
END;

--16) Crie uma nova conexão com CURSO PLSQL.

--17) Execute os seguintes comandos:

DECLARE
   v_ID SEGMERCADO.ID%type := 5;
   v_DESCRICAO SEGMERCADO.DESCRICAO%type := 'Esportistas';
BEGIN
   INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_ID, UPPER(v_DESCRICAO));
   COMMIT;
END;

--18) Para excluir o ID 5, execute o código:

DECLARE
   v_ID SEGMERCADO.ID%type := 5;
BEGIN
   DELETE FROM SEGMERCADO WHERE ID = v_ID;
   COMMIT;
END;

--19) Para fazer uma inclusão de segmento de mercado na tabela SEGMERCADO, execute:

DECLARE
   v_ID SEGMERCADO.ID%type := 4;
   v_DESCRICAO SEGMERCADO.DESCRICAO%type := 'Atacado';
BEGIN
   INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_ID, UPPER(v_DESCRICAO));
   COMMIT;
END;

--20) Veja a alteração do segmento de mercado na tabela:

DECLARE
   v_ID SEGMERCADO.ID%type := 3;
   v_DESCRICAO SEGMERCADO.DESCRICAO%type := 'Atacadista';
BEGIN
   UPDATE SEGMERCADO SET DESCRICAO = UPPER(v_DESCRICAO) WHERE ID = v_ID;
   COMMIT;
END;

--21) Exclua um segmento de mercado em SEGMERCADO:

DECLARE
   v_ID SEGMERCADO.ID%type := 5;
BEGIN
   DELETE FROM SEGMERCADO WHERE ID = v_ID;
   COMMIT;
END;