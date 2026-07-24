*** Settings ***   
Library    SeleniumLibrary
Library     FakerLibrary    locale=pt_BR

variables   ../resources/data/env_config.yaml
variables   ../resources/data/fakerInfo.py

*** Variables ***
#LOGIN
${CAMPO_EMAIL}    //input[@data-qa='login-email']
${CAMPO_SENHA}    //input[@data-qa='login-password']
${BOTAO_LOGIN}    //button[@data-qa='login-button']
${TEXTO_LOGADO}    //a//b

#Mensagem login
${TEXT_LOGIN}    //div[@class='login-form']//h2

#ALERTA
${TEXTO_ALERTA}    //form[@action='/login']//p
${TEXTO_ALERTA_CADASTRO}    //form[@action='/signup']//p

#CADASTRO
${CAMPO_NOME}    //input[@data-qa='signup-name']
${CAMPO_EMAIL_CADASTRO}    //input[@data-qa='signup-email']
${BOTAO_CADASTRO}    //button[@data-qa='signup-button']
${CAMPO_SENHA_CADASTRO}    //input[@data-qa='password']
${CAMPO_DIA_NASCIMENTO}    id=days
${CAMPO_MES_NASCIMENTO}    id=months
${CAMPO_ANO_NASCIMENTO}    id=years
${CAMPO_PRIMEIRO_NOME}    //input[@data-qa='first_name']
${CAMPO_ULTIMO_NOME}    //input[@data-qa='last_name']
${CAMPO_EMPRESA}    //input[@data-qa='company']
${CAMPO_ENDERECO1}    //input[@data-qa='address']
${CAMPO_ENDERECO2}    //input[@data-qa='address2']
${CAMPO_PAIS}    id=country
${CAMPO_ESTADO}    //input[@data-qa='state']
${CAMPO_CIDADE}    //input[@data-qa='city']
${CAMPO_CEP}    //input[@data-qa='zipcode']
${CAMPO_CELULAR}    //input[@data-qa='mobile_number']
${BOTAO_CRIAR_CONTA}    //button[@data-qa='create-account']
${MENSAGEM_CADASTRO_REALIZADO}    //h2[@data-qa='account-created']

*** Keywords ***
Realizar login
    [Documentation]    Realiza o login com sucesso no site
    [Arguments]    ${email}    ${password}
    Input Text    ${CAMPO_EMAIL}    ${email}
    Input Text    ${CAMPO_SENHA}    ${password}
    Click Element    ${BOTAO_LOGIN}

# Asserções    
Verificar que estou na pagina de login e cadastro
    [Documentation]    Verifica se estou na página de login e cadastro do site
    Element Text Should Be     ${TEXT_LOGIN}    Login to your account

Verificar login realizado com sucesso
    [Arguments]    ${nome_usuario}
    Element Should Contain    ${TEXTO_LOGADO}    ${nome_usuario}

Verificar mensagem de usuario/senha invalida
    [Documentation]    Verifica se a mensagem de erro é exibida ao tentar logar com usuário inválido
    [Arguments]    ${mensagem_esperada}
    Element Text Should Be    ${TEXTO_ALERTA}    ${mensagem_esperada}

Verificar cadastro realizado com sucesso
    [Documentation]    Verifica se o cadastro foi realizado com sucesso
    [Arguments]    ${mensagem_esperada}
    Element Text Should Be    ${MENSAGEM_CADASTRO_REALIZADO}    ${mensagem_esperada}


Verificar mensagem de email já cadastrado
    [Documentation]    Verifica se a mensagem de erro é exibida ao tentar cadastrar um usuário com email já existente
    [Arguments]    ${mensagem_esperada}
    Element Text Should Be    ${TEXTO_ALERTA_CADASTRO}    ${mensagem_esperada}

#Ações
Preencher campos de cadastro
    [Documentation]    Preenche os campos de cadastro com nome e email
    [Arguments]    ${nome}    ${email}
    Input Text    ${CAMPO_NOME}    ${nome}
    Input Text    ${CAMPO_EMAIL_CADASTRO}    ${email}
    Click Button    ${BOTAO_CADASTRO}

Preencher formulario de cadastro
    [Documentation]    Preenche o formulário de cadastro com os dados do usuário
    # [Arguments]    ${Titulo}    ${password}    ${dia_nascimento}    ${mes_nascimento}    ${ano_nascimento}    ${primeiro_nome}    
    # ...    ${ultimo_nome}    ${empresa}    ${endereco1}    ${endereco2}    ${pais}    ${estado}    ${cidade}    ${cep}    ${celular}
    Click Element    //input[@value='${TITULO}']
    Input Text    ${CAMPO_SENHA_CADASTRO}    ${FAKE_SENHA}
    Select From List By Value    ${CAMPO_DIA_NASCIMENTO}    ${FAKE_DIA_NASCIMENTO}
    Select From List By Value    ${CAMPO_MES_NASCIMENTO}    ${FAKE_MES_NASCIMENTO}
    Select From List By Value    ${CAMPO_ANO_NASCIMENTO}    ${FAKE_ANO_NASCIMENTO}
    Input Text    ${CAMPO_PRIMEIRO_NOME}    ${FAKE_PRIMEIRO_NOME}
    Input Text    ${CAMPO_ULTIMO_NOME}    ${FAKE_ULTIMO_NOME}
    Input Text    ${CAMPO_EMPRESA}    ${FAKE_EMPRESA}
    Input Text    ${CAMPO_ENDERECO1}    ${FAKE_ENDERECO1}
    Input Text    ${CAMPO_ENDERECO2}    ${FAKE_ENDERECO2}
    Select From List By Value    ${CAMPO_PAIS}    ${FAKE_PAIS}
    Input Text    ${CAMPO_ESTADO}    ${FAKE_ESTADO}
    Input Text    ${CAMPO_CIDADE}    ${FAKE_CIDADE}
    Input Text    ${CAMPO_CEP}    ${FAKE_CEP}
    Input Text    ${CAMPO_CELULAR}    ${FAKE_CELULAR}

Clicar no botão de criar conta
    [Documentation]    Clica no botão de criar conta após preencher o formulário de cadastro
    Click Element    ${BOTAO_CRIAR_CONTA}
