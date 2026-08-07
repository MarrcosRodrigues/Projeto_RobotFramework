*** Settings ***   
Library    SeleniumLibrary

*** Variables ***
#TEXTO
${TEXTO_PRODUTOS}    //h2[@class='title text-center']
${NOME_PRODUTO}    //div[@class='productinfo text-center']//p

#CAMPOS
${CAMPO_BUSCAR}    id=search_product

#BOTÕES
${BOTAO_PESQUISAR}    id=submit_search


*** Keywords ***
#Ações
Buscar produto na barra de pesquisa
    [Documentation]    Busca um produto na barra de pesquisa do site
    [Arguments]    ${PRODUTO}
    Input Text    ${CAMPO_BUSCAR}    ${PRODUTO}

Clicar no botão pesquisar
    [Documentation]    Clica no botão pesquisar para buscar o produto
    Click Button    ${BOTAO_PESQUISAR}

#Asserção
Verificar que estou na página de produtos
    [Documentation]    Verifica se estou na página de produtos do site
    [ARGUMENTS]    ${TEXTO_ESPERADO}
    Element Text Should Be    ${TEXTO_PRODUTOS}    ${TEXTO_ESPERADO}

Verificar se o produto "${PRODUTO}" foi exibido
    [Documentation]    Verifica se o produto "${PRODUTO}" foi exibido na página de produtos
    Element Text Should Be    ${NOME_PRODUTO}    ${PRODUTO}
