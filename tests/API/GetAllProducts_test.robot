*** Settings ***
Resource    ../resources/keywords/KeywordsAPI/GetAllProducts.resource

*** Test Cases ***
Realizar GET nos produtos da AutomationPractice
    Realizar GET de todos os produtos
       
Realizar POST nos produtos da AutomationPractice
    Realizar POST para a API de todos os produtos

Realizar GET nas marcas da AutomationPractice
    Realizar GET de todos as marcas

Realizar PUT nas marcas da AutomationPractice
    Realizar PUT para a API de todas as marcas

Realizar POST para buscar produto em AutomationPractice
    Realizar POST para a API de procurar produtos

Realizar POST para buscar produto em AutomationPractice sem passar parametro
    Realizar POST para a API de procurar produtos sem parametro