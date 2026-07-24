*** Settings ***
resource    ../resources/base/base.robot
resource    ../resources/keywords/HomePage.robot
Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Acessar página de login e cadastro
    HomePage.Acessar pagina inicial
    HomePage.Acessar pagina de login e cadastro    