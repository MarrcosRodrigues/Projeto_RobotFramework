*** Settings ***
Library    RequestsLibrary
Resource    ../resources/base/base.resource

*** Keywords ***
Realizar GET de todos os produtos
    [Documentation]    Realiza uma requisição GET para obter todos os produtos no site Automation Practice
    Criar Sessão no AutomationPractice
    ${resultado}  GET On Session    alias=AutomationPractice    url=/api/productsList    expected_status=200
    Log     ${resultado.json()['products']}

Realizar GET de todos as marcas
    [Documentation]    Realiza uma requisição GET para obter todas as marcas no site Automation Practice
    Criar Sessão no AutomationPractice
    ${resultado}  GET On Session    alias=AutomationPractice    url=/api/brandsList    expected_status=200
    Log     ${resultado.json()['brands']}

Realizar POST para a API de todos os produtos
    [Documentation]    Realiza uma requisição POST para a API de todos os produtos no site Automation Practice
    Criar Sessão no AutomationPractice

    ${resultado}  POST On Session    alias=AutomationPractice    url=/api/productsList   expected_status=200
    Should Be Equal As Strings    ${resultado.json()['responseCode']}    405
    Log     ${resultado.json()['responseCode']} 

Realizar PUT para a API de todas as marcas
    [Documentation]    Realiza uma requisição PUT para a API de todas as marcas no site Automation Practice
    Criar Sessão no AutomationPractice

    ${resultado}  PUT On Session    alias=AutomationPractice    url=/api/brandsList   expected_status=200
    Should Be Equal As Strings    ${resultado.json()['responseCode']}    405
    Log     ${resultado.json()['responseCode']} 

Realizar POST para a API de procurar produtos
    [Documentation]    Realiza uma requisição POST para a API de procurar produtos no site Automation Practice
    Criar Sessão no AutomationPractice
    
    ${parametro}    Create Dictionary    search_product=tshirt
    ${headers}      Create Dictionary    Content-Type=application/x-www-form-urlencoded

    ${resultado}  POST On Session    alias=AutomationPractice   url=/api/searchProduct    data=${parametro}    headers=${headers}    expected_status=200
    Log     ${resultado.json()['products']} 

Realizar POST para a API de procurar produtos sem parametro
    [Documentation]    Realiza uma requisição POST para a API de procurar produtos sem passar o parametro de pesquisa
    Criar Sessão no AutomationPractice
    
    ${headers}      Create Dictionary    Content-Type=application/x-www-form-urlencoded

    ${resultado}  POST On Session    alias=AutomationPractice   url=/api/searchProduct    headers=${headers}    expected_status=200
    Should Be Equal As Strings    ${resultado.json()['responseCode']}    400
    Log     ${resultado.json()['responseCode']} 