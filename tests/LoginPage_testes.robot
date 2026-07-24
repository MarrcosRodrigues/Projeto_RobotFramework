*** Settings ***
resource    ../resources/base/base.robot
resource    ../resources/keywords/LoginPage.robot
resource    ../resources/keywords/HomePage.robot

Library     FakerLibrary    locale=pt_BR

variables   ../resources/data/fakerInfo.py

Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Realizar login com sucesso
    HomePage.Acessar pagina inicial
    HomePage.Acessar pagina de login e cadastro    
    LoginPage.Realizar login    ${users.valid_user.email}    ${users.valid_user.password}
    LoginPage.Verificar login realizado com sucesso    ${users.valid_user.name}

Realizar login com usuario invalido
    HomePage.Acessar pagina inicial
    HomePage.Acessar pagina de login e cadastro 
    LoginPage.Verificar que estou na pagina de login e cadastro   
    LoginPage.Realizar login   ${FAKE_EMAIL}    ${FAKE_SENHA}
    LoginPage.Verificar mensagem de usuario/senha invalida    Your email or password is incorrect!
    
Realizar logout
    HomePage.Acessar pagina inicial
    HomePage.Acessar pagina de login e cadastro  
    LoginPage.Verificar que estou na pagina de login e cadastro 
    LoginPage.Realizar login    ${users.valid_user.email}    ${users.valid_user.password}
    LoginPage.Verificar login realizado com sucesso    ${users.valid_user.name}
    HomePage.Clicar em logout

Realizar cadastro de um usuario
    HomePage.Acessar pagina inicial
    HomePage.Acessar pagina de login e cadastro
    LoginPage.Verificar que estou na pagina de login e cadastro
    LoginPage.Preencher campos de cadastro    ${FAKE_NOME}    ${FAKE_EMAIL}
    LoginPage.Preencher formulario de cadastro    
    ...    ${TITULO}    ${FAKE_SENHA}    
    ...    ${FAKE_DIA_NASCIMENTO}    ${FAKE_MES_NASCIMENTO}    ${FAKE_ANO_NASCIMENTO}    
    ...    ${FAKE_PRIMEIRO_NOME}    ${FAKE_ULTIMO_NOME}    
    ...    ${FAKE_EMPRESA}    ${FAKE_ENDERECO1}    ${FAKE_ENDERECO2}    
    ...    ${FAKE_PAIS}    ${FAKE_ESTADO}    ${FAKE_CIDADE}    ${FAKE_CEP}    
    ...    ${FAKE_CELULAR}
    LoginPage.Clicar no botão de criar conta
    LoginPage.Verificar cadastro realizado com sucesso    ACCOUNT CREATED!

Realizar cadastro de um usuario com email ja existente
    HomePage.Acessar pagina inicial
    HomePage.Acessar pagina de login e cadastro
    LoginPage.Preencher campos de cadastro    ${users.valid_user.name}    ${users.valid_user.email}
    LoginPage.Verificar mensagem de email já cadastrado    Email Address already exist!

Realizar cadastro de um usuario e deleta-lo
    HomePage.Acessar pagina inicial
    HomePage.Acessar pagina de login e cadastro
    LoginPage.Preencher campos de cadastro    ${FAKE_NOME}    ${FAKE_EMAIL}
    LoginPage.Preencher formulario de cadastro    
    ...    ${TITULO}    ${FAKE_SENHA}    
    ...    ${FAKE_DIA_NASCIMENTO}    ${FAKE_MES_NASCIMENTO}    ${FAKE_ANO_NASCIMENTO}    
    ...    ${FAKE_PRIMEIRO_NOME}    ${FAKE_ULTIMO_NOME}    
    ...    ${FAKE_EMPRESA}    ${FAKE_ENDERECO1}    ${FAKE_ENDERECO2}    
    ...    ${FAKE_PAIS}    ${FAKE_ESTADO}    ${FAKE_CIDADE}    ${FAKE_CEP}    
    ...    ${FAKE_CELULAR}
    LoginPage.Clicar no botão de criar conta
    LoginPage.Verificar cadastro realizado com sucesso    ACCOUNT CREATED!
    HomePage.Acessar pagina de login e cadastro
    LoginPage.Verificar login realizado com sucesso    ${FAKE_NOME}
    HomePage.Clicar em Delete Account    ACCOUNT DELETED!