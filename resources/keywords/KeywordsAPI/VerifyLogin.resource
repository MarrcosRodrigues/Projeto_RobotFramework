*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}    https://automationexercise.com 

*** Keywords ***
Criar Sessão no AutomationPractice
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/x-www-form-urlencoded
    Create Session    alias=AutomationPractice    url=${URL}    headers=${headers}

Verificar login
    [Arguments]    ${email}    ${senha}    ${message}    ${status}
    Criar Sessão no AutomationPractice

    ${parametros}    Create Dictionary    email=${email}    password=${senha}

    ${response}    POST On Session    alias=AutomationPractice    url=/api/verifyLogin    data=${parametros}    expected_status=200
    
    Should Be Equal As Strings    ${response.json()['message']}    ${message}
    Should Be Equal As Strings    ${response.json()['responseCode']}    ${status}
    
    Log    ${response.json()}

Enviar DELETE para a verificação de login
    Criar Sessão no AutomationPractice

    ${response}    DELETE On Session   alias=AutomationPractice    url=/api/verifyLogin    expected_status=200

    Should Be Equal As Strings    ${response.json()['responseCode']}    405

    Log    ${response.json()}