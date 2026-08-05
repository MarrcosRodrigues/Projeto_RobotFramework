*** Settings ***
Resource    ../resources/keywords/KeywordsAPI/DeleteAccount.resource

*** Test Cases ***
Deletar usuario com sucesso
    Realizar deleção de usuario    Account deleted!    200
