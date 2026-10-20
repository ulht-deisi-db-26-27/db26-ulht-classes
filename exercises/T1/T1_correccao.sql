-- 1. Identificação e metadados
-- Identifica todas as tabelas da base de dados/schema
SELECT * 
    FROM INFORMATION_SCHEMA.TABLES t
    WHERE t.TABLE_CATALOG = 'bikestores';

-- Escolhe duas tabelas que consideres fundamentais para base de dados:
-- Para cada uma das tabelas, lista os campos, tipos de dados, incluindo tamanhos, e nulidade.
SELECT   c.COLUMN_NAME
        ,c.TABLE_NAME
        ,c.TABLE_SCHEMA
        ,CONCAT(c.DATA_TYPE,'(',COALESCE(CAST(c.CHARACTER_MAXIMUM_LENGTH AS VARCHAR(10)),CONCAT(CAST(c.NUMERIC_PRECISION AS VARCHAR(10)),',',c.NUMERIC_SCALE),''),')')
        ,IIF(c.IS_NULLABLE= 'YES','NULL','NOT NULL')
    FROM INFORMATION_SCHEMA.COLUMNS c
    WHERE c.TABLE_NAME IN ('products','brands')
-- Consegues identificar se estas tabelas têm dependências entre si? justifica
/* É de considerar que estejam relacionadas uma vez que existe um atributo comum - 'brand_id'
 */

-- 2. Consultas e operações básicas
--Escolhe uma tabela com um campo numérico ou de data. Apresenta apenas os registos cujos valores nesse campo estejam fora de um intervalo definido por ti. Inclui no resultado o campo utilizado na condição e pelo menos dois outros campos.
SELECT * FROM production.products p WHERE p.model_year NOT BETWEEN 2017 AND 2018

-- 3. Operações de linha
-- Escolhe dois campos de texto da mesma tabela,onde um deles possa conter valores nulos, e apresenta um novo valor composto por parte do conteúdo de um dos campos e pelo conteúdo completo do outro. Converte o resultado final para minúsculas e mantém no resultado os campos originais.
-- Ordena o resultado pela coluna apresentada com o conteúdo completo.
-- O resultado não pode apresentar valores nulos
SELECT * FROM INFORMATION_SCHEMA.COLUMNS c 
    WHERE c.IS_NULLABLE = 'YES' AND c.DATA_TYPE LIKE '%char%'
/* Utilizemos a table [stores]*/
SELECT * FROM sales.stores

SELECT s.store_name,ISNULL(street,'no street adreess'),LOWER(CONCAT(ISNULL(LEFT(s.street,4),'0000'),s.store_name))
    FROM sales.stores s
    ORDER BY 3 -- também se pode indicar a expressão de projecção

-- 4. Consultas formatadas
-- Escolhe uma tabela com um campo númerido utilizado como identificador e um campo de texto utilizado como classificador.
/* Utilizemos a table [stores], cokuns [store_id] e [store_name]*/
SELECT s.store_id,s.store_name FROM sales.stores s
-- Constrói uma consulta de apresentação final com pelo menos quatro colunas. Deve incluir:
-- - uma concatenação de texto, --> CONCAT()
-- - uma conversão explícita de tipo, --> CAST
-- - a substituição de um possível valor nulo e --> ISNULL
-- - a formatação de um campo numérico ou de data. --> FORMAT()
-- Mantém pelo menos um dos valores originais junto do respetivo valor transformado.
SELECT   s.store_id,s.store_name
        ,CONCAT(FORMAT(s.store_id,'0000'),'-',s.store_name)
        ,ISNULL(s.phone,'no contact')
        ,CAST(ISNULL(LEFT(s.street,4),'0000') AS DECIMAL(4))
    FROM sales.stores s

-- 5. Inserções e validação
-- Antes de qualquer inserção, começa por identificar o tipo de dados e a obrigatoriedade de preenchimento das colunas
SELECT   c.COLUMN_NAME
        ,c.TABLE_NAME
        ,c.TABLE_SCHEMA
        ,CONCAT(c.DATA_TYPE,'(',COALESCE(CAST(c.CHARACTER_MAXIMUM_LENGTH AS VARCHAR(10)),CONCAT(CAST(c.NUMERIC_PRECISION AS VARCHAR(10)),',',c.NUMERIC_SCALE),''),')')
        ,IIF(c.IS_NULLABLE= 'YES','NULL','NOT NULL')
    FROM INFORMATION_SCHEMA.COLUMNS c
    WHERE c.TABLE_NAME IN ('stores')
-- Depois de qualquer inserção, termina com uma consulta que permita confirmar o registo inserido.

-- Escolhe uma tabela com o mínimo de quatro colunas, pelo menos uma delas não obrigatória.
-- Antes de fazer qualquer inserção, verifica que o identificador que vais utilizar não existe na tabela
SELECT * FROM sales.stores s WHERE s.store_id = 999

-- Insere um novo regito na tabela com o identificador testado na pergunta anterior e preenchendo apenas as colunas obrigatórias
/*INSERT INTO sales.stores
        (store_id,store_name)
    VALUES
        (999,'Teste 1')
        */
/*  A inserção acima produz erro porque a tabela tem IDENTITY (atribuição automática de Id)  
 *  A situação, que NÃO É UM ERRO, pode ser contornada de duas formas:
 *  1. Alterar a tabela para desabilitar o automatismo: 
 *          SET IDENTITY_INSERT sales.stores ON
 *      Depois de fazer a inserção, não esquecer de repor o automatismo
 *          SET IDENTITY_INSERT sales.stores OFF
 */
SET IDENTITY_INSERT sales.stores ON
INSERT INTO sales.stores
        (store_id,store_name)
    VALUES
        (999,'Teste 1')
SET IDENTITY_INSERT sales.stores OFF
/*  2. Fazer a inserção sem o ID, o SGBD trata de preencher a coluna com o automatismo referido
 *          INSERT INTO sales.stores
 *              (store_name)
 *             VALUES
 *              ('Teste 2')
 *      Neste caso, sendo o ID atribuido pelo SGBD, não é possível verificar a sua existÊncia prévia...
 *      ... como se percebe, não existe!
 *      Em contrapartida, a verificação de inserção requer mais cuidado porque o ID não é conhecido 
 */
INSERT INTO sales.stores
        (store_name)
    VALUES
        ('Teste 2')

SELECT * 
    FROM sales.stores

-- 6. Uniformização de texto
-- Escolhe uma tabela que contenha campos de texto e escreve instrução SQL para converte o conteúdo de um campo de texto para maiúsculas.
-- Atualiza apenas os registos em que um campo à tua escolha tenha um de dois valores. Um desses valores poderá ter sido o obtido numa das perguntas anteriores.
UPDATE sales.stores
    SET city = UPPER(city)
    WHERE state IN ('ca','ny')

SELECT * 
    FROM sales.stores

-- 7. Tratamento de valores em falta
-- Escolhe uma tabela com campos que permitam valores vazios e escreve instrução SQL para preencher um campo de texto que esteja vazio, concatenando um prefixo definido por ti com o valor de outro campo do mesmo registo. Garante que o campo usado como origem não está vazio.
UPDATE sales.stores
    SET street = CONCAT(FORMAT(store_id,'0000'),'-',store_name)
    WHERE street IS NULL AND store_id IS NOT NULL AND store_name IS NOT NULL

SELECT * 
    FROM sales.stores
-- 8. Construção de valores de texto
-- Escolhe uma tabela com campos de texto adequados e escreve instruções SQL para atualizar um campo de texto com a concatenação de um prefixo definido por ti e dos quatro últimos caracteres de um campo de texto, convertidos para minúsculas. Limita a atualização através de uma condição de intervalo, aplicada a um campo numérico ou de data dessa tabela.
-- Escolhe campos de origem com comprimento suficiente e exclui os registos em que algum dos valores a concatenar esteja vazio.
UPDATE sales.stores
    SET email = CONCAT('invalid-',RIGHT(store_name,4))
    WHERE store_name IS NOT NULL AND
        store_id BETWEEN 1000 AND 2000

SELECT * 
    FROM sales.stores

/* Pode-se adicionar código para evitar erro para o caso do valor de [store_name] não ter 4 caracteres:
        UPDATE sales.stores
            SET email = CONCAT('invalid-',IIF(LEN(store_name) < 4,store_name,RIGHT(store_name,4)))
            WHERE store_name IS NOT NULL AND
                store_id BETWEEN 1000 AND 2000
    O uso de um filtro em WHERE não evita problemas, a função RIGHT é executada independentemente do filtro
        UPDATE sales.stores
            SET email = CONCAT('invalid-',RIGHT(store_name,8))
            WHERE store_name IS NOT NULL AND
                store_id BETWEEN 1000 AND 2000     

    NOTA:   Nas versões modernas do MS-SQL, esta validação é desnecessária
            O SGBD devolve o caracteres existentes se a truncagem for superior ao cumprimento sem gerar erro
            Em todo o caso, fica o exemplo de validação
 */            


-- 9. Eliminação de registos
-- Elimina o registo inserido na pergunta 5, utilizando o identificador que foi testado antes da inserção.
-- Certifica-te que é feito primeiro uma consulta que identifique os registos a eliminar e, depois, é então executada a instrução para apagar registos.
SELECT * 
    FROM sales.stores
    WHERE store_id = 999

DELETE FROM sales.stores WHERE store_id = 999  
DELETE FROM sales.stores WHERE store_id = 1004 
/* para efeito de coerência, devem ser eliminados os dois registos inseridos
        DELETE FROM sales.stores WHERE store_id = 1004 
    O numero inserido com o IDENTITY INSERT será diferente a cada inserção, pelo que terá que ser identificado
    antes da remoção
 */        
-- Demonstra que o registo e apenas aquele que foi inserido na pergunta 5 foi eliminado.
SELECT * 
    FROM sales.stores