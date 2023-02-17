--1) Abra o Oracle SQL Developer.

--2) Fa�a a conex�o default, com a m�quina local.

--3) Voc� ir� um novo usu�rio para criar um novo ambiente Oracle.

--4) Primeiramente, execute o comando
ALTER SESSION SET _oracle_script = true;

--5) Voc� est� usando o usu�rio system.

--6) Para criar o usu�rio cursoplsql, use o comando
CREATE USER cursoplsql IDENTIFIED BY cursoplsql DEFAULT TABLESPACE USERS;

--7) Para dar privil�gios de acesso a este usu�rio
GRANT connect, resource TO cursoplsql;

--8) � esquerda, em Conex�es, clique com o bot�o direito do mouse em cima de Oracle Conex�es e selecione Nova Conex�o.

--9) O nome dessa nova conex�o ser� CURSOPLSQL. Em Nome do Usu�rio, insira o usu�rio que voc� criou anteriormente e crie uma senha. Al�m disso, voc� pode clicar em Salvar Senha.

--10) Teste e clique em Conectar.

--11) Para criar o esquema mostrado, crie um novo script usando a conex�o CURSO PLSQL.

--12) Crie a tabela SEGMERCADO
CREATE TABLE segmercado (
    id        NUMBER(5),
    descricao VARCHAR2(100)
);

--13) Agora crie a tabela CLIENTE
CREATE TABLE cliente (
    id                   NUMBER(5),
    razao_social         VARCHAR2(100),
    cnpj                 VARCHAR2(20),
    segmercado_id        NUMBER(5),
    data_inclusao        DATE,
    faturamento_previsto NUMBER(10, 2),
    categoria            VARCHAR2(20)
);

--14) Altere a tabela para criar a chave prim�ria da tabela SEGMERCADO
ALTER TABLE segmercado ADD CONSTRAINT segmercaco_id_pk PRIMARY KEY ( id );

--15) Agora a chave prim�ria para a tabela CLIENTE
ALTER TABLE cliente ADD CONSTRAINT cliente_id_pk PRIMARY KEY ( id );

--16) Para criar as chaves estrangeira na tabela CLIENTE, execute
ALTER TABLE cliente ADD CONSTRAINT cliente_segmercado_id FOREIGN KEY ( segmercado_id )
    REFERENCES segmercado