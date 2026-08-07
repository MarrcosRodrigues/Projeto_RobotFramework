*** Settings ***
library    RequestsLibrary
Resource    ../resources/base/base.resource
Resource    ../resources/keywords/KeywordsAPI/CreateAccount.resource


*** Keywords ***
Realizar GET para obter usuario por email
    [Documentation]    Realiza uma requisição GET para obter os detalhes do usuário por email no site Automation Practice
    [Arguments]    ${status}
    ${dados}    Gerar Dados Aleatorios

    Criar Sessão no AutomationPractice

    Realizar criação de usuario    User created!    201

    ${parametro}    Create Dictionary    email=${email_criado}

    ${response}    GET On Session   alias=AutomationPractice   url=/api/getUserDetailByEmail    params=${parametro}    expected_status=200

    Should Be Equal As Strings    ${response.json()['responseCode']}     ${status}
    Should Be Equal As Strings    ${response.json()['user']['email']}     ${email_criado}

    log    ${response.json()}
    log    ${response.json()['responseCode']}
    log    ${response.json()['user']['email']}
