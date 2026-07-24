*** Settings ***
library    SeleniumLibrary

*** Variables ***
${BROWSER}      edge

*** Keywords ***
Abrir navegador
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window

Fechar navegador  
    Close Browser