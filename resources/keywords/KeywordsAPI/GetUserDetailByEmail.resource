*** Settings ***
library    RequestsLibrary
Resource    ../resources/keywords/KeywordsAPI/CreateAccount.resource

*** Keywords ***
Criar Sessão no AutomationPractice
    ${headers}    Create Dictionary    accept=application/json  Content-Type=application/x-www-form-urlencoded
    Create Session    alias=AutomationPractice    url=https://automationexercise.com   headers=${headers}

Realizar GET para obter usuario por email
    [Arguments]    ${status}

    Criar Sessão no AutomationPractice

    Realizar criação de usuario    User created!    201

    ${parametro}    Create Dictionary    email=${FAKE_EMAIL}

    ${response}    GET On Session   alias=AutomationPractice   url=/api/getUserDetailByEmail    params=${parametro}    expected_status=200

    Should Be Equal As Strings    ${response.json()['responseCode']}     ${status}
    Should Be Equal As Strings    ${response.json()['user']['email']}     ${FAKE_EMAIL}

    log    ${response.json()}
    log    ${response.json()['responseCode']}
    log    ${response.json()['user']['email']}
