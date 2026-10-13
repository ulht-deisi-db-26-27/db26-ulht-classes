-- para os exercícios iniciais, utiliza a tabela [DEPARTMENTS]/[JOB]
-- 1. Identifica as colunas de preenchimento obrigatório
SELECT * FROM INFORMATION_SCHEMA.COLUMNS c WHERE c.TABLE_NAME = 'DEPARTMENTS' AND c.IS_NULLABLE = 'NO';
-- 2. Insere um novo departamento/função, de nome 'DEISI'/'Dean', executando os seguintes comandos
-- 2.1. Identifica o último código da tabela
SELECT MAX(d.DEPARTMENT_ID) FROM HR.DEPARTMENTS d
-- ou
-- 2.1. Escolhe um código para função e mostra que não existe (a verificação de existência tem que devolver 0)
SELECT COUNT(j.JOB_ID) FROM HR.JOBS j WHERE j.JOB_ID = 'DN_SCHO' 
-- 2.2. 
-- Consultando apenas a coluna do nome, verifica que o nome que vais dar ao departamento/função cumpre as regras da tabela (pode-se verificar apenas o tipo de dados da tabela)
SELECT LEN('Departamento de Engenharia Informatica e Sistemas de Informação'),c.CHARACTER_MAXIMUM_LENGTH  
    FROM INFORMATION_SCHEMA.COLUMNS c 
    WHERE c.TABLE_NAME='departments' AND c.COLUMN_NAME LIKE '%name%'
-- repete o exercício até teres um nome válido (têm que exisitir duas respostas, uma válida e outra não)
SELECT LEN('Dep E.Informatica S.Informação'),c.CHARACTER_MAXIMUM_LENGTH  
    FROM INFORMATION_SCHEMA.COLUMNS c 
    WHERE c.TABLE_NAME='departments' AND c.COLUMN_NAME LIKE '%name%'
-- 2.3. Utilizando os resultados anterios, inserre o departamento/função indicando apenas as colunas de preenchimento obrigatório
--       (departamento) O id tem que ser superior ao obtido em 2.1
INSERT INTO HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME)
    VALUES(280,'Dep E.Informatica S.Informação')
-- 2.4 Mostra que a inserção foi realizada com sucesso (listar apenas a linha inserida)
SELECT * FROM HR.DEPARTMENTS d WHERE d.DEPARTMENT_ID = 280;
-- 3. Insere-te o professor da aula como funcionário da empresa, para o departamento/função que acabaste de inserir
--    Usa o departamento/função inserida em 2.3 (para que tenha inserido departamento, utilizar a função 'AD_PRES')
--    Utilizar a data de sistema para data de contratação
--    Indicar explicitamente que o professor não tem chefia
--    Insere um valor superior a 0 para o vencmento base
--    Além das colunas obrigatórias (verificar), têm que ser inseridos os seguintes dados: 'FIRST_NAME', 'EMAIL' e vencimento
--    no email, não adicionar '@' nem dominio
--    Os dados devem ser reais
INSERT INTO HR.EMPLOYEES
    (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,PHONE_NUMBER,EMAIL,HIRE_DATE,JOB_ID,DEPARTMENT_ID, MANAGER_ID, SALARY)
    VALUES
    (2703,'Luis','Gomes','0','p2703',GETDATE(),'AD_PRES',280,NULL,1)
-- 4. Insere-te como funcionario da empresa, para o departamento/função que acabaste de inserir
--    Usa o departamento/função inserida em 2.3 (para que tenha inserido departamento, utilizar a função 'IT_PROG')
--    Utilizar a data de sistema para data de contratação
--    Indicar explicitamente que o professor como chefia
--    Além das colunas obrigatórias (verificar), têm que ser inseridos os seguintes dados: 'FIRST_NAME' e 'EMAIL'
--    no email, não adicionar '@' nem dominio
--    Os dados devem ser reais
--    (é suposto que esta dê erro porque a coluna ID só suporta 6 digitos...)
INSERT INTO HR.EMPLOYEES
    (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,PHONE_NUMBER,EMAIL,HIRE_DATE,JOB_ID,DEPARTMENT_ID,MANAGER_ID,SALARY)
    VALUES
    (123456,'Luis','Gomes','0','a123456',GETDATE(),'IT_PROG',280,2703,1)
-- 5. Lista as duas inserções dos exercícios anterior com as seguintes condições
--    - o ID deve ser apresentado sempre com 6 digitos
--    - O nome deve ser apresentado no formato 'apelido, nome próprio'
--    - data apresentada por extenso em português
--    - o email deve ser apresentado acrescdo do dominio da lusófona
--    - Nenhuma coluna pode apresentar valores nulos
--    - o vencimento deve ser apresentado como moeda, com 3 casas decimais
--    - todas as colunas devem ter nomes legiveis
SELECT   FORMAT(e.EMPLOYEE_ID,'0#####') as 'ID'
        ,e.LAST_NAME + ',' + FIRST_NAME as 'nome'
        ,FORMAT(e.HIRE_DATE,'dd MMMM yyyy','pt-PT') as 'contratação'
        ,LOWER(e.EMAIL)+'@ulusofona.pt' as 'email'
        ,FORMAT(ISNULL(e.SALARY,0),'C3','pt-PT') as vencimento
        ,e.DEPARTMENT_ID
        ,e.JOB_ID
        ,ISNULL(CAST(e.MANAGER_ID AS VARCHAR(6)),'N/A') as 'chefe'
    FROM HR.EMPLOYEES e
    WHERE e.EMPLOYEE_ID IN (2703,123456)

DELETE
    FROM HR.EMPLOYEES 
    WHERE EMPLOYEE_ID IN (2703,123456)