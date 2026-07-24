*** Settings ***   
Library    SeleniumLibrary

*** Variables ***
${TEXTO_PRODUTOS}    //h2[@class='title text-center']
${NOME_PRODUTO}    //div[@class='productinfo text-center']//p

#CAMPOS
${CAMPO_BUSCAR}    id=search_product

#BOTÕES
${BOTAO_PESQUISAR}    id=submit_search


*** Keywords ***

Verificar que estou na página de produtos
    [Documentation]    Verifica se estou na página de produtos do site
    [ARGUMENTS]    ${TEXTO_ESPERADO}
    Element Text Should Be    ${TEXTO_PRODUTOS}    ${TEXTO_ESPERADO}

Buscar produto na barra de pesquisa
    [Arguments]    ${PRODUTO}
    Input Text    ${CAMPO_BUSCAR}    ${PRODUTO}

Clicar no botão pesquisar
    Click Button    ${BOTAO_PESQUISAR}

Verificar se o produto "${PRODUTO}" foi exibido
    Element Text Should Be    ${NOME_PRODUTO}    ${PRODUTO}
