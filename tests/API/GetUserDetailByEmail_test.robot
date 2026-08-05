*** Settings ***
Resource    ../resources/keywords/KeywordsAPI/GetUserDetailByEmail.resource

*** Test Cases ***
Obter detalhe de um usuario pelo email
    Realizar GET para obter usuario por email    200