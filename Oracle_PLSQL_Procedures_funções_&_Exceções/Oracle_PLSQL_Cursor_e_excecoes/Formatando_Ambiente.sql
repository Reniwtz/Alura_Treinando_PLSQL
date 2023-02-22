-- 1) Se você está iniciando este curso usando uma máquina limpa, sem o Oracle, deve ir ao curso Introdução ao SQL com Oracle: manipule e consulte dados Introdução ao SQL com Oracle: manipule e consulte dados e seguir os passos completos mostrados pelo instrutor referentes à instalação dos produtos:
-- Instalando o Oracle Express Edition
-- Instalando o Oracle Developer
-- Criando a conexão

-- 2) Crie um script vazio usando a conexão criada durante a instalação, aquela mesma que usa o usuário system, e execute os seguintes comandos para criar um novo acesso, que será usado neste curso:
ALTER SESSION SET "_ORACLE_SCRIPT" = true;

CREATE USER cursoplsql2 IDENTIFIED BY cursoplsql2 DEFAULT TABLESPACE USERS;

GRANT connect, resource TO cursoplsql2;

ALTER USER cursoplsql2 QUOTA UNLIMITED ON USERS;

-- 3) Faça a conexão usando o usuário cursoplsql2 que você acabou de criar e crie um novo script.

-- 4) Execute as linhas abaixo para criar as tabelas que serão usadas neste treinamento:
CREATE TABLE segmercado (
    id        NUMBER(5),
    descricao VARCHAR2(100)
);

CREATE TABLE cliente (
    id                   NUMBER(5),
    razao_social         VARCHAR2(100),
    cnpj                 VARCHAR2(20),
    segmercado_id        NUMBER(5),
    data_inclusao        DATE,
    faturamento_previsto NUMBER(10, 2),
    categoria            VARCHAR2(20)
);

ALTER TABLE segmercado ADD CONSTRAINT segmercaco_id_pk PRIMARY KEY ( id );

ALTER TABLE cliente ADD CONSTRAINT cliente_id_pk PRIMARY KEY ( id );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_segmercado_id FOREIGN KEY ( segmercado_id )
        REFERENCES segmercado ( id );

CREATE TABLE produto_exercicio (
    cod       VARCHAR2(5),
    descricao VARCHAR2(100),
    categoria VARCHAR2(100)
);

CREATE TABLE produto_venda_exercicio (
    id                 NUMBER(5),
    cod_produto        VARCHAR2(5),
    data               DATE,
    quantidade         FLOAT,
    preco              FLOAT,
    valor_total        FLOAT,
    percentual_imposto FLOAT
);

ALTER TABLE produto_exercicio ADD CONSTRAINT produto_exercicio_cod_pk PRIMARY KEY ( cod );

ALTER TABLE produto_venda_exercicio ADD CONSTRAINT produto_venda_exercicio_id_pk PRIMARY KEY ( id );

ALTER TABLE produto_venda_exercicio
    ADD CONSTRAINT produto_venda_exercicio_produto_exercicio_cod FOREIGN KEY ( cod_produto )
        REFERENCES produto_exercicio ( cod );

INSERT INTO segmercado (
    id,
    descricao
) VALUES (
    '3',
    'ATACADISTA'
);

INSERT INTO segmercado (
    id,
    descricao
) VALUES (
    '1',
    'VAREJISTA'
);

INSERT INTO segmercado (
    id,
    descricao
) VALUES (
    '2',
    'INDUSTRIAL'
);

INSERT INTO segmercado (
    id,
    descricao
) VALUES (
    '4',
    'FARMACEUTICOS'
);

INSERT INTO cliente (
    id,
    razao_social,
    cnpj,
    segmercado_id,
    data_inclusao,
    faturamento_previsto,
    categoria
) VALUES (
    '3',
    'SUPERMERCADO CARIOCA',
    '22222222222',
    '1',
    TO_DATE('13/06/22', 'DD/MM/RR'),
    '30000',
    'MÉDIO'
);

INSERT INTO cliente (
    id,
    razao_social,
    cnpj,
    segmercado_id,
    data_inclusao,
    faturamento_previsto,
    categoria
) VALUES (
    '1',
    'SUPERMERCADOS CAMPEAO',
    '1234567890',
    '1',
    TO_DATE('12/06/22', 'DD/MM/RR'),
    '90000',
    'MEDIO GRANDE'
);

INSERT INTO cliente (
    id,
    razao_social,
    cnpj,
    segmercado_id,
    data_inclusao,
    faturamento_previsto,
    categoria
) VALUES (
    '2',
    'SUPERMERCADO DO VALE',
    '11111111111',
    '1',
    TO_DATE('13/06/22', 'DD/MM/RR'),
    '90000',
    'MÉDIO GRANDE'
);

INSERT INTO produto_exercicio (
    cod,
    descricao,
    categoria
) VALUES (
    '41232',
    'Sabor de Verão > Laranja > 1 Litro',
    'Sucos de Frutas'
);

INSERT INTO produto_exercicio (
    cod,
    descricao,
    categoria
) VALUES (
    '32223',
    'Sabor de Verão > Uva > 1 Litro',
    'Sucos de Frutas'
);

INSERT INTO produto_exercicio (
    cod,
    descricao,
    categoria
) VALUES (
    '67120',
    'Frescor da Montanha > Aroma Limão > 1 Litro',
    'Águas'
);

INSERT INTO produto_exercicio (
    cod,
    descricao,
    categoria
) VALUES (
    '92347',
    'Aroma do Campo > Mate > 1 Litro',
    'Mate'
);

INSERT INTO produto_exercicio (
    cod,
    descricao,
    categoria
) VALUES (
    '33854',
    'Frescor da Montanha > Aroma Laranja > 1 Litro',
    'Águas'
);

INSERT INTO produto_venda_exercicio (
    id,
    cod_produto,
    data,
    quantidade,
    preco,
    valor_total,
    percentual_imposto
) VALUES (
    '1',
    '41232',
    TO_DATE('01/01/22', 'DD/MM/RR'),
    '100',
    '10',
    '1000',
    '100'
);

INSERT INTO produto_venda_exercicio (
    id,
    cod_produto,
    data,
    quantidade,
    preco,
    valor_total,
    percentual_imposto
) VALUES (
    '2',
    '92347',
    TO_DATE('01/01/22', 'DD/MM/RR'),
    '200',
    '25',
    '5000',
    '15'
);

-- 5) O próximo passo é criar as procedures e funções. Para isso, execute os comandos abaixo. Lembrando que os mesmos devem ser executados de forma isolada,
-- um a um. Todos os comandos podem ser obtidos fazendo o download do arquivo ESQUEMA.SQL. Abaixo, o primeiro bloco a ser executado:

create or replace FUNCTION categoria_cliente
(p_FATURAMENTO IN CLIENTE.FATURAMENTO_PREVISTO%type)
RETURN CLIENTE.CATEGORIA%type
IS
   v_CATEGORIA CLIENTE.CATEGORIA%type;
BEGIN
   IF p_FATURAMENTO <= 10000 THEN
      v_CATEGORIA := 'PEQUENO';
   ELSIF p_FATURAMENTO <= 50000 THEN
      v_CATEGORIA := 'MÉDIO';
   ELSIF p_FATURAMENTO <= 100000 THEN
      v_CATEGORIA := 'MÉDIO GRANDE';
   ELSE
      v_CATEGORIA := 'GRANDE';
   END IF;
   RETURN v_CATEGORIA;
END;

-- 6) O segundo bloco:
CREATE OR REPLACE FUNCTION obter_descricao_segmercado (
    p_id IN segmercado.id%TYPE
) RETURN segmercado.descricao%TYPE IS
    v_descricao segmercado.descricao%TYPE;
BEGIN
    SELECT
        descricao
    INTO v_descricao
    FROM
        segmercado
    WHERE
        id = p_id;

    RETURN v_descricao;
END;

-- 7) Terceiro bloco:

CREATE OR REPLACE FUNCTION retorna_categoria (
    p_cod IN produto_exercicio.cod%TYPE
) RETURN produto_exercicio.categoria%TYPE IS
    v_categoria produto_exercicio.categoria%TYPE;
BEGIN
    SELECT
        categoria
    INTO v_categoria
    FROM
        produto_exercicio
    WHERE
        cod = p_cod;

    RETURN v_categoria;
END;

-- 8) Quarto bloco:
create or replace FUNCTION RETORNA_IMPOSTO 
(p_COD_PRODUTO produto_venda_exercicio.cod_produto%type)
RETURN produto_venda_exercicio.percentual_imposto%type
IS
   v_CATEGORIA produto_exercicio.categoria%type;
   v_IMPOSTO produto_venda_exercicio.percentual_imposto%type;
BEGIN
   v_CATEGORIA := retorna_categoria(p_COD_PRODUTO);
   IF TRIM(v_CATEGORIA) = 'Sucos de Frutas' THEN
      v_IMPOSTO := 10;
   ELSIF TRIM(v_CATEGORIA) = 'Águas' THEN
      v_IMPOSTO := 20;
   ELSIF TRIM(v_CATEGORIA) = 'Mate' THEN
      v_IMPOSTO := 15;
   END IF;
   RETURN v_IMPOSTO;
END;

-- 9) Quinto bloco:
CREATE OR REPLACE PROCEDURE alterando_categoria_produto (
    p_cod       produto_exercicio.cod%TYPE,
    p_categoria produto_exercicio.categoria%TYPE
) IS
BEGIN
    UPDATE produto_exercicio
    SET
        categoria = p_categoria
    WHERE
        cod = p_cod;

    COMMIT;
END;

-- 10) Sexto bloco:
CREATE OR REPLACE PROCEDURE excluindo_produto (
    p_cod produto_exercicio.cod%TYPE
) IS
BEGIN
    DELETE FROM produto_exercicio
    WHERE
        cod = p_cod;

    COMMIT;
END;

-- 11) Sétimo bloco:
CREATE OR REPLACE PROCEDURE incluindo_dados_venda (
    p_id          produto_venda_exercicio.id%TYPE,
    p_cod_produto produto_venda_exercicio.cod_produto%TYPE,
    p_data        produto_venda_exercicio.data%TYPE,
    p_quantidade  produto_venda_exercicio.quantidade%TYPE,
    p_preco       produto_venda_exercicio.preco%TYPE
) IS
    v_valor      produto_venda_exercicio.valor_total%TYPE;
    v_percentual produto_venda_exercicio.percentual_imposto%TYPE;
BEGIN
    v_percentual := retorna_imposto(p_cod_produto);
    v_valor := p_quantidade * p_preco;
    INSERT INTO produto_venda_exercicio (
        id,
        cod_produto,
        data,
        quantidade,
        preco,
        valor_total,
        percentual_imposto
    ) VALUES (
        p_id,
        p_cod_produto,
        p_data,
        p_quantidade,
        p_preco,
        v_valor,
        v_percentual
    );

    COMMIT;
END;

-- 12) Oitavo bloco:
CREATE OR REPLACE PROCEDURE incluindo_produto (
    p_cod       produto_exercicio.cod%TYPE,
    p_descricao produto_exercicio.descricao%TYPE,
    p_categoria produto_exercicio.categoria%TYPE
) IS
BEGIN
    INSERT INTO produto_exercicio (
        cod,
        descricao,
        categoria
    ) VALUES (
        p_cod,
        replace(p_descricao, '-', '>'),
        p_categoria
    );

    COMMIT;
END;

-- 13) Nono bloco:
CREATE OR REPLACE PROCEDURE incluir_cliente (
    p_id          cliente.id%TYPE,
    p_razao       cliente.razao_social%TYPE,
    p_cnpj        cliente.cnpj%TYPE,
    p_segmercado  cliente.segmercado_id%TYPE,
    p_faturamento cliente.faturamento_previsto%TYPE
) IS
    v_categoria cliente.categoria%TYPE;
BEGIN
    v_categoria := categoria_cliente(p_faturamento);
    INSERT INTO cliente VALUES (
        p_id,
        p_razao,
        p_cnpj,
        p_segmercado,
        sysdate,
        p_faturamento,
        v_categoria
    );

    COMMIT;
END;

-- 14) Décimo bloco:
CREATE OR REPLACE PROCEDURE incluir_segmercado (
    p_id        IN segmercado.id%TYPE,
    p_descricao IN segmercado.descricao%TYPE
) IS
BEGIN
    INSERT INTO segmercado (
        id,
        descricao
    ) VALUES (
        p_id,
        upper(p_descricao)
    );

    COMMIT;
END;

-- 15) O usuário pediu que você formate o CNPJ do cliente com o seguinte formato: Os 3 primeiros dígitos do número digitados concatenados com uma /** , seguidos dos próximos 2 dígitos, concatenados com **- e finalmente todos os dígitos restantes a partir do sexto número. Para obter a função que formata o número, execute o SQL abaixo:
SELECT SUBSTR(CNPJ, 1,3) || '/' || SUBSTR(CNPJ, 4,2) || '-' || SUBSTR(CNPJ,6) AS CNPJ_FORMATADO FROM CLIENTE;