*** Settings ***
Resource    ../resources/keywords/KeywordsAPI/CreateAccount.resource

*** Test Cases ***
Criar novo usuario com sucesso
    Realizar criação de usuario    User created!    201
