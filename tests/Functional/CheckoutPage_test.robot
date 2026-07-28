*** Settings ***
resource    ../resources/base/base.resource
resource    ../resources/keywords/KeywordsFunctional/HomePage.resource
resource    ../resources/keywords/KeywordsFunctional/CheckoutPage.resource
resource    ../resources/keywords/KeywordsFunctional/LoginPage.resource
Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Finalizar compra com usuário logado
    HomePage.Acessar pagina inicial
    HomePage.Acessar pagina de login e cadastro    
    LoginPage.Realizar login    ${users.valid_user.email}    ${users.valid_user.password}
    LoginPage.Verificar login realizado com sucesso    ${users.valid_user.name}

    HomePage.Acessar pagina inicial
    HomePage.Adicionar produto Soft Stretch Jeans ao carrinho
    HomePage.Verificar adição do produto ao carrinho    Added!
    HomePage.Ver carrinho
    CheckoutPage.Clicar em Proceed To Checkout
    CheckoutPage.Clicar em Place Order
    CheckoutPage.Preencher dados do cartão
    CheckoutPage.Clicar em pagar e confirmar
    CheckoutPage.Verificar confirmação do pedido    ORDER PLACED!
