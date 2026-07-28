*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Criar Sessão no AutomationPractice
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
    Create Session    alias=AutomationPractice    url=https://automationexercise.com   headers=${headers}

Realizar GET de todos os produtos
    Criar Sessão no AutomationPractice
    ${resultado}  GET On Session    alias=AutomationPractice    url=/api/productsList    expected_status=200
    Log     ${resultado.body}
