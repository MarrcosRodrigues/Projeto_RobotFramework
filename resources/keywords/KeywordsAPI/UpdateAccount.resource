*** Settings ***
Library    RequestsLibrary

Resource    ../resources/base/base.resource
Resource    ../resources/keywords/KeywordsAPI/CreateAccount.resource

*** Keywords ***
Realizar atualização do usuario
    [Documentation]    Realiza a atualização do usuário no site Automation Practice através de uma requisição PUT
    [Arguments]    ${message}    ${status}
    ${dados}    Gerar Dados Aleatorios

    Criar Sessão no AutomationPractice
    
    Realizar criação de usuario    User created!    201

    ${parametros}    Create Dictionary    name=${dados}[FAKE_NOME]    email=${email_criado}   password=${senha_criada}    title=${dados}[TITULO]    
    ...    birth_date=${dados}[FAKE_DIA_NASCIMENTO]    birth_month=${dados}[FAKE_MES_NASCIMENTO]    birth_year=${dados}[FAKE_ANO_NASCIMENTO]    firstname=${dados}[FAKE_PRIMEIRO_NOME]    
    ...    lastname=${dados}[FAKE_ULTIMO_NOME]    company=${dados}[FAKE_EMPRESA]    address1=${dados}[FAKE_ENDERECO1]    address2=${dados}[FAKE_ENDERECO2]    country=${dados}[FAKE_PAIS]    
    ...    zipcode=${dados}[FAKE_CEP]    state=${dados}[FAKE_ESTADO]    city=${dados}[FAKE_CIDADE]    mobile_number=${dados}[FAKE_CELULAR]

    ${response}    PUT On Session   alias=AutomationPractice   url=/api/updateAccount   data=${parametros}   expected_status=200
    Should Be Equal As Strings    ${response.json()['message']}    ${message}
    Should Be Equal As Strings    ${response.json()['responseCode']}    ${status}

    Log    ${response.json()}