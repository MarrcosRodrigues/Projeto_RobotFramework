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

Realizar GET de todos as marcas
    Criar Sessão no AutomationPractice
    ${resultado}  GET On Session    alias=AutomationPractice    url=/api/brandsList    expected_status=200
    Log     ${resultado.json()['brands']}

Realizar POST para a API de todos os produtos
    Criar Sessão no AutomationPractice

    ${resultado}  POST On Session    alias=AutomationPractice    url=/api/productsList   expected_status=200
    Should Be Equal As Strings    ${resultado.json()['responseCode']}    405
    Log     ${resultado.json()['responseCode']} 

Realizar PUT para a API de todas as marcas
    Criar Sessão no AutomationPractice

    ${resultado}  PUT On Session    alias=AutomationPractice    url=/api/brandsList   expected_status=200
    Should Be Equal As Strings    ${resultado.json()['responseCode']}    405
    Log     ${resultado.json()['responseCode']} 

Realizar POST para a API de procurar produtos
    Criar Sessão no AutomationPractice
    
    ${parametro}    Create Dictionary    search_product=tshirt
    ${headers}      Create Dictionary    Content-Type=application/x-www-form-urlencoded

    ${resultado}  POST On Session    alias=AutomationPractice   url=/api/searchProduct    data=${parametro}    headers=${headers}    expected_status=200
    Log     ${resultado.json()['products']} 

Realizar POST para a API de procurar produtos sem parametro
    Criar Sessão no AutomationPractice
    
    ${headers}      Create Dictionary    Content-Type=application/x-www-form-urlencoded

    ${resultado}  POST On Session    alias=AutomationPractice   url=/api/searchProduct    headers=${headers}    expected_status=200
    Should Be Equal As Strings    ${resultado.json()['responseCode']}    400
    Log     ${resultado.json()['responseCode']} 