*** Settings ***
Library    RequestsLibrary

Resource    ../resources/base/base.resource
Resource    ../resources/keywords/KeywordsAPI/CreateAccount.resource

*** Keywords ***
Realizar atualização do usuario
    [Documentation]    Realiza a atualização do usuário no site Automation Practice através de uma requisição PUT
    [Arguments]    ${message}    ${status}
    Criar Sessão no AutomationPractice
    
    Realizar criação de usuario    User created!    201

    ${parametros}    Create Dictionary    name=${FAKE_NOME}    email=${FAKE_EMAIL}    password=${FAKE_SENHA}    title=${TITULO}    
    ...    birth_date=${FAKE_DIA_NASCIMENTO}    birth_month=${FAKE_MES_NASCIMENTO}    birth_year=${FAKE_ANO_NASCIMENTO}    firstname=${FAKE_PRIMEIRO_NOME}    
    ...    lastname='Ultimo Nome'    company=${FAKE_EMPRESA}    address1='Endereço Fake 1'    address2=${FAKE_ENDERECO2}    country=${FAKE_PAIS}    
    ...    zipcode=${FAKE_CEP}    state=${FAKE_ESTADO}    city=${FAKE_CIDADE}    mobile_number=${FAKE_CELULAR}

    ${response}    PUT On Session   alias=AutomationPractice   url=/api/updateAccount   data=${parametros}   expected_status=200
    Should Be Equal As Strings    ${response.json()['message']}    ${message}
    Should Be Equal As Strings    ${response.json()['responseCode']}    ${status}

    Log    ${response.json()}