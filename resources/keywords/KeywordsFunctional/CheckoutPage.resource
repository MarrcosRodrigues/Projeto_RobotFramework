*** Settings ***   
Library    SeleniumLibrary
resource    ../resources/keywords/KeywordsFunctional/HomePage.resource

variables   ../resources/data/fakerInfo.py

*** Variables ***

#BOTÕES
${FAZER_CHECKOUT}    //a[@class='btn btn-default check_out']
${BOTAO_PLACE_ORDER}    //a[@href='/payment']
${BOTAO_PAGAR_CONFIRMAR}    //button[@id='submit']

#TEXTO NA TELA DE CHECKOUT
${TEXTO_CHECKOUT}    //h2[contains(text(),'Address Details')]
${TEXTO_HEADER}    //h2[@class='heading']
${TEXTO_CONFIRMACAO_PEDIDO}    //h2[@class='title text-center']

#CAMPOS
${CAMPO_NOME_CARTAO}    //input[@name='name_on_card']
${CAMPO_NUM_CARTAO}    //input[@name='card_number']
${CAMPO_CVC}    //input[@name='cvc']
${CAMPO_DATA_EXP_MES}    //input[@name='expiry_month']
${CAMPO_DATA_EXP_ANO}    //input[@name='expiry_year']

*** Keywords ***
#Ações
Clicar em Proceed To Checkout
    [Documentation]    Clica no botão Proceed To Checkout na página de checkout
    Click Element    ${FAZER_CHECKOUT}

Clicar em Place Order
    [Documentation]    Clica no botão Place Order na página de checkout
    Scroll Element Into View    ${FAZER_CHECKOUT}
    
    Click Element    ${BOTAO_PLACE_ORDER}
    
    Fechar popup
    Element Text Should Be    ${TEXTO_HEADER}    Payment
    

Preencher dados do cartão
    [Documentation]    Preenche os dados do cartão na página de checkout
    Input Text    ${CAMPO_NOME_CARTAO}    ${FAKE_NOME}
    Input Text    ${CAMPO_NUM_CARTAO}    ${FAKE_NUM_CARTAO}
    Input Text    ${CAMPO_CVC}    ${FAKE_CVC}
    Input Text    ${CAMPO_DATA_EXP_MES}    ${FAKE_MES_NASCIMENTO}
    Input Text    ${CAMPO_DATA_EXP_ANO}    ${FAKE_ANO_NASCIMENTO}

Clicar em pagar e confirmar
    [Documentation]    Clica no botão pagar e confirmar na página de checkout
    Click Button    ${BOTAO_PAGAR_CONFIRMAR}

#Asserção
Verificar confirmação do pedido
    [Documentation]    Verifica se a confirmação do pedido foi exibida na página de checkout
    [Arguments]    ${TEXTO_ESPERADO}
    Element Text Should Be    ${TEXTO_CONFIRMACAO_PEDIDO}    ${TEXTO_ESPERADO}