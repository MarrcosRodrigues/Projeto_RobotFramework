*** Settings ***
library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***
${BROWSER}      edge
${URL}          https://automationexercise.com

*** Keywords ***
Abrir navegador
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window

Fechar navegador  
    Close Browser

*** Keywords ***
Criar Sessão no AutomationPractice
    [Documentation]    Cria uma sessão no site Automation Practice para realizar requisições HTTP
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/x-www-form-urlencoded
    Create Session    alias=AutomationPractice    url=${URL}    headers=${headers}