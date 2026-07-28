*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Keywords ***
Criar Sessão no AutomationPractice
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
    Create Session    alias=AutomationPractice    url=https://automationexercise.com   headers=${headers}

Realizar GET de todos os produtos
    Criar Sessão no AutomationPractice
    ${resultado}  GET On Session    alias=AutomationPractice    url=/api/productsList    expected_status=200
    Log     ${resultado.json()['products']}

Realizar POST de todos os produtos
    Criar Sessão no AutomationPractice

    ${resultado}  POST On Session    alias=AutomationPractice    url=/api/productsList   expected_status=200
    Should Be Equal As Strings    ${resultado.json()['responseCode']}    405
    Log     ${resultado.json()['responseCode']} 