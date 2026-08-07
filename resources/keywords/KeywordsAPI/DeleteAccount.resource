*** Settings ***
library    RequestsLibrary

Resource    ../resources/base/base.resource
resource    ../resources/keywords/KeywordsAPI/CreateAccount.resource

*** Keywords ***
Realizar deleção de usuario
    [Documentation]    Realiza a deleção do usuário no site Automation Practice através de uma requisição DELETE
    [Arguments]    ${message}    ${status}
    ${dados}    Gerar Dados Aleatorios

    Criar Sessão no AutomationPractice
    
    Realizar criação de usuario    User created!    201

    ${parametros}    create Dictionary    email=${email_criado}   password=${senha_criada}

    ${response}    DELETE On Session   alias=AutomationPractice   url=/api/deleteAccount    data=${parametros}   expected_status=200
    Should Be Equal As Strings    ${response.json()['message']}    ${message}
    Should Be Equal As Strings    ${response.json()['responseCode']}    ${status}

    Log    ${response.json()}

