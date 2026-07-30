*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL}    https://automationexercise.com 

*** Keywords ***
Criar Sessão no AutomationPractice
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/x-www-form-urlencoded
    Create Session    alias=AutomationPractice    url=${URL}    headers=${headers}

Verificar login com credenciais validas
    [Arguments]    ${email}    ${senha}
    Criar Sessão no AutomationPractice

    ${parametros}    Create Dictionary    email=${email}    password=${senha}

    ${response}    POST On Session    alias=AutomationPractice    url=/api/verifyLogin    data=${parametros}    expected_status=200
    Should Be Equal As Strings    ${response.json()['message']}    User exists!
    Log    ${response.json()}