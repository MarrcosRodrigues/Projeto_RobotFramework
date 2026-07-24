*** Settings ***
library    SeleniumLibrary

*** Variables ***
${URL}    https://automationexercise.com/
${CATEGORIA}    //div[@id="accordian"]/../h2
${LOGIN_CADASTRO}    //a[@href='/login']

${BOTAO_HOME}    //a[@href='/']
${BOTAO_DELETE}    //a[@href='/delete_account']
${MENSAGEM_DELETE}    //h2[@data-qa='account-deleted']

#Iframe
${IFRAME}    //iframe[@id='aswift_2']
${FECHAR_POPUP}    id=dismiss-button-element

*** Keywords ***
Acessar pagina inicial
    [Documentation]    Acessa a página inicial do site
    Go To    ${URL}
    Element Text Should Be    ${CATEGORIA}      CATEGORY
    
Acessar pagina de login e cadastro
    [Documentation]    Acessa a página de login e cadastro do site
    Click Element    ${LOGIN_CADASTRO}

Clicar em logout
    [Documentation]    Clica no botão de logout
    Click Element    //a[@href='/logout']
    Element Text Should Be    ${LOGIN_CADASTRO}     Signup / Login

Clicar em Delete Account
    [Documentation]    Clica no botão de deletar conta
    [Arguments]    ${MENSAGEM_ESPERADA_DELETE}
    Click Element    ${BOTAO_HOME}
    ${IFRAME_PRESENT}=    Run Keyword And Return Status    Page Should Contain Element    ${IFRAME}

    IF    ${IFRAME_PRESENT} == True
        Select Frame    ${IFRAME}
        Click Element    ${FECHAR_POPUP}
        Unselect Frame
        Click Element    ${BOTAO_DELETE}
    END
    
    Element Text Should Be    ${MENSAGEM_DELETE}     ${MENSAGEM_ESPERADA_DELETE}