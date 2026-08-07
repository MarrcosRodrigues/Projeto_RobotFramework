*** Settings ***
Library    RequestsLibrary
Library    ../../data/fakerInfo.py
Library    Collections
Resource    ../resources/base/base.resource

*** Keywords ***
Realizar criação de usuario
    [Documentation]    Realiza a criação do usuário no site Automation Practice através de uma requisição POST
    [Arguments]    ${message}    ${status}
    ${dados}    Gerar Dados Aleatorios
    
    Criar Sessão no AutomationPractice
    

    ${parametros}    Create Dictionary    name=${dados}[FAKE_NOME]    email=${dados}[FAKE_EMAIL]    password=${dados}[FAKE_SENHA]    title=${dados}[TITULO]    
    ...    birth_date=${dados}[FAKE_DIA_NASCIMENTO]    birth_month=${dados}[FAKE_MES_NASCIMENTO]    birth_year=${dados}[FAKE_ANO_NASCIMENTO]    firstname=${dados}[FAKE_PRIMEIRO_NOME]    
    ...    lastname=${dados}[FAKE_ULTIMO_NOME]    company=${dados}[FAKE_EMPRESA]    address1=${dados}[FAKE_ENDERECO1]    address2=${dados}[FAKE_ENDERECO2]    country=${dados}[FAKE_PAIS]    
    ...    zipcode=${dados}[FAKE_CEP]    state=${dados}[FAKE_ESTADO]    city=${dados}[FAKE_CIDADE]    mobile_number=${dados}[FAKE_CELULAR]

    ${response_criacao}    POST On Session   alias=AutomationPractice   url=/api/createAccount   data=${parametros}   expected_status=200
    Should Be Equal As Strings    ${response_criacao.json()['message']}    ${message}
    Should Be Equal As Strings    ${response_criacao.json()['responseCode']}    ${status}

    #Obtendo email criado e passando para viavel email_criado
    ${parametros_get}    Create Dictionary    email=${dados}[FAKE_EMAIL]
    ${response_get}    GET On Session   alias=AutomationPractice   url=/api/getUserDetailByEmail    params=${parametros_get}    expected_status=200
    ${json_Get}    Set Variable    ${response_get.json()}

    ${email_criado}=    Set Variable    ${json_Get['user']['email']}
    ${senha_criada}=    Set Variable    ${dados}[FAKE_SENHA]
    
    Set Global Variable    ${email_criado}
    Set Global Variable    ${senha_criada}

    log    ${response_criacao.json()}