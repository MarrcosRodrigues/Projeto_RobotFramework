*** Settings ***
library    SeleniumLibrary

*** Variables ***
${URL}    https://automationexercise.com/
${CATEGORIA}    //div[@id="accordian"]/../h2

#Páginas
${LOGIN_CADASTRO_MODAL}    //a[@href='/login']
${PAGINA_PRODUTOS}    //a[@href='/products']

#BOTÕES
${BOTAO_HOME}    //a[@href='/']
${BOTAO_DELETE}    //a[@href='/delete_account']
${VER_CARRINHO}    //p//a[@href='/view_cart']
${BOTAO_LOGOUT}    //a[@href='/logout']

#MENSAGENS
${MENSAGEM_DELETE}    //h2[@data-qa='account-deleted']
${MENSAGEM_ADICIONADO}    //h4[@class='modal-title w-100']

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
    Click Element    ${LOGIN_CADASTRO_MODAL}

Clicar em logout
    [Documentation]    Clica no botão de logout
    Click Element    ${BOTAO_LOGOUT}
    Element Text Should Be    ${LOGIN_CADASTRO_MODAL}     Signup / Login

Clicar em Delete Account
    [Documentation]    Clica no botão de deletar conta
    [Arguments]    ${MENSAGEM_ESPERADA_DELETE}
    Click Element    ${BOTAO_HOME}

    Fechar popup
    
    Click Element    ${BOTAO_DELETE}
    
    Element Text Should Be    ${MENSAGEM_DELETE}     ${MENSAGEM_ESPERADA_DELETE}

Acessar página de produtos
    [Documentation]    Acessa a página de produtos do site
    Click Element    ${BOTAO_HOME}
    
    Fechar popup

    Click Element    ${PAGINA_PRODUTOS}

Fechar popup
    [Documentation]    Fecha o popup do site
    ${IFRAME_PRESENT}=    Run Keyword And Return Status    Page Should Contain Element    ${IFRAME}

    IF    ${IFRAME_PRESENT} == True
        Select Frame    ${IFRAME}
        Click Element    ${FECHAR_POPUP}
        Unselect Frame
    END

Adicionar produto ${PRODUTO} ao carrinho
    Click Element    //div[@class='productinfo text-center']//p[contains(.,'${PRODUTO}')]/../a

Verificar adição do produto ao carrinho
    [Arguments]    ${MENSAGEM_ESPERADA}
    Wait Until Element Is Visible    ${MENSAGEM_ADICIONADO}
    Element Text Should Be    ${MENSAGEM_ADICIONADO}    ${MENSAGEM_ESPERADA}

Ver carrinho
    Click Element    ${VER_CARRINHO}