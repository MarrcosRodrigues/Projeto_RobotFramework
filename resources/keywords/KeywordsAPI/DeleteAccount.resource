*** Settings ***
library    RequestsLibrary

resource    ../resources/keywords/KeywordsAPI/CreateAccount.resource

*** Keywords ***
Criar Sessão no AutomationPractice
    ${headers}    Create Dictionary    accept=application/json  Content-Type=application/x-www-form-urlencoded
    Create Session    alias=AutomationPractice    url=https://automationexercise.com   headers=${headers}

Realizar deleção de usuario
    [Arguments]    ${message}    ${status}
    Criar Sessão no AutomationPractice
    
    Realizar criação de usuario    User created!    201

    ${parametros}    create Dictionary    email=${FAKE_EMAIL}   password=${FAKE_SENHA}

    ${response}    DELETE On Session   alias=AutomationPractice   url=/api/deleteAccount    data=${parametros}   expected_status=200
    Should Be Equal As Strings    ${response.json()['message']}    ${message}
    Should Be Equal As Strings    ${response.json()['responseCode']}    ${status}

    Log    ${response.json()}

