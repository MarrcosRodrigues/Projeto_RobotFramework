*** Settings ***
Library    RequestsLibrary

Resource    ../resources/base/base.resource

*** Keywords ***
Verificar login
    [Documentation]    Verifica o login do usuário no site Automation Practice através de uma requisição POST
    [Arguments]    ${email}    ${senha}    ${message}    ${status}
    Criar Sessão no AutomationPractice

    ${parametros}    Create Dictionary    email=${email}    password=${senha}

    ${response}    POST On Session    alias=AutomationPractice    url=/api/verifyLogin    data=${parametros}    expected_status=200
    
    Should Be Equal As Strings    ${response.json()['message']}    ${message}
    Should Be Equal As Strings    ${response.json()['responseCode']}    ${status}
    
    Log    ${response.json()}

Enviar DELETE para a verificação de login
    [Documentation]    Envia uma requisição DELETE para a verificação de login no site Automation Practice
    Criar Sessão no AutomationPractice

    ${response}    DELETE On Session   alias=AutomationPractice    url=/api/verifyLogin    expected_status=200

    Should Be Equal As Strings    ${response.json()['responseCode']}    405

    Log    ${response.json()}