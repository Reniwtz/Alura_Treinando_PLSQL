--1) Abra o Oracle SQL Developer.

--2) Faça a conexão default, com a máquina local.

--3) Você irá um novo usuário para criar um novo ambiente Oracle.

--4) Primeiramente, execute o comando
ALTER SESSION SET _oracle_script = true;

--5) Você está usando o usuário system.

--6) Para criar o usuário cursoplsql, use o comando
CREATE USER cursoplsql IDENTIFIED BY cursoplsql DEFAULT TABLESPACE USERS;

--7) Para dar privilégios de acesso a este usuário
GRANT connect, resource TO cursoplsql;

--8) À esquerda, em Conexões, clique com o botão direito do mouse em cima de Oracle Conexões e selecione Nova Conexão.

--9) O nome dessa nova conexão será CURSOPLSQL. Em Nome do Usuário, insira o usuário que você criou anteriormente e crie uma senha. Além disso, você pode clicar em Salvar Senha.

--10) Teste e clique em Conectar.

--11) Para criar o esquema mostrado, crie um novo script usando a conexão CURSO PLSQL.

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

--14) Altere a tabela para criar a chave primária da tabela SEGMERCADO
ALTER TABLE segmercado ADD CONSTRAINT segmercaco_id_pk PRIMARY KEY ( id );

--15) Agora a chave primária para a tabela CLIENTE
ALTER TABLE cliente ADD CONSTRAINT cliente_id_pk PRIMARY KEY ( id );

--16) Para criar as chaves estrangeira na tabela CLIENTE, execute
ALTER TABLE cliente ADD CONSTRAINT cliente_segmercado_id FOREIGN KEY ( segmercado_id )
    REFERENCES segmercado