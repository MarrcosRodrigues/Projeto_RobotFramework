*** Settings ***
resource    ../resources/base/base.resource
resource    ../resources/keywords/KeywordsFunctional/LoginPage.resource
resource    ../resources/keywords/KeywordsFunctional/HomePage.resource
resource    ../resources/keywords/KeywordsFunctional/ProdutosPage.resource


Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Buscar produto na barra de pesquisa
    [Tags]    Pesquisa
    HomePage.Acessar pagina inicial
    HomePage.Acessar página de produtos
    ProdutosPage.Verificar que estou na página de produtos    ALL PRODUCTS
    ProdutosPage.Buscar produto na barra de pesquisa    Winter Top
    ProdutosPage.Clicar no botão pesquisar
    ProdutosPage.Verificar se o produto "Winter Top" foi exibido

Adicionar produto no carrinho na página inicial
    [Tags]    Adicionar
    HomePage.Acessar pagina inicial
    HomePage.Adicionar produto Soft Stretch Jeans ao carrinho
    HomePage.Verificar adição do produto ao carrinho    Added!