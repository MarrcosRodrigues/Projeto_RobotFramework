*** Settings ***
resource    ../resources/base/base.resource
resource    ../resources/keywords/HomePage.resource
Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Acessar página de login e cadastro
    HomePage.Acessar pagina inicial
    HomePage.Acessar pagina de login e cadastro    