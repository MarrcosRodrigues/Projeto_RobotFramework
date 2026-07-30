*** Settings ***
Resource    ../resources/keywords/KeywordsAPI/VerifyLogin.resource

Variables    ../../resources/data/env_config.yaml

*** Test Cases ***
Verificar login com usuario valido
    Verificar login com credenciais validas    ${users.valid_user.email}    ${users.valid_user.password}
