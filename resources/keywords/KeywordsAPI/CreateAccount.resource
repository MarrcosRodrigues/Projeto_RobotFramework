*** Settings ***
Library    RequestsLibrary
Resource    ../resources/base/base.resource
Variables    ../../data/fakerInfo.py

*** Keywords ***
Realizar criação de usuario
    [Documentation]    Realiza a criação do usuário no site Automation Practice através de uma requisição POST
    [Arguments]    ${message}    ${status}

    Criar Sessão no AutomationPractice

    ${parametros}    Create Dictionary    name=${FAKE_NOME}    email=${FAKE_EMAIL}    password=${FAKE_SENHA}    title=${TITULO}    
    ...    birth_date=${FAKE_DIA_NASCIMENTO}    birth_month=${FAKE_MES_NASCIMENTO}    birth_year=${FAKE_ANO_NASCIMENTO}    firstname=${FAKE_PRIMEIRO_NOME}    
    ...    lastname=${FAKE_ULTIMO_NOME}    company=${FAKE_EMPRESA}    address1=${FAKE_ENDERECO1}    address2=${FAKE_ENDERECO2}    country=${FAKE_PAIS}    
    ...    zipcode=${FAKE_CEP}    state=${FAKE_ESTADO}    city=${FAKE_CIDADE}    mobile_number=${FAKE_CELULAR}

    ${response}    POST On Session   alias=AutomationPractice   url=/api/createAccount   data=${parametros}   expected_status=200
    Should Be Equal As Strings    ${response.json()['message']}    ${message}
    Should Be Equal As Strings    ${response.json()['responseCode']}    ${status}

    log    ${response.json()}