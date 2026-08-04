*** Settings ***
Resource    ../resources/keywords/KeywordsAPI/VerifyLogin.resource

Variables    ../../resources/data/env_config.yaml
Variables    ../../resources/data/fakerInfo.py

*** Test Cases ***
Verificar login com usuario valido
    Verificar login    ${users.valid_user.email}    ${users.valid_user.password}    User exists!    200

Verificar login sem passar email
    Verificar login    ${NONE}    ${users.valid_user.password}    Bad request, email or password parameter is missing in POST request.    400

DELETE para api de verificação de login
    Enviar DELETE para a verificação de login

Verificar login com usuario invalido
    Verificar login    ${FAKE_EMAIL}    ${FAKE_SENHA}    User not found!    404
    