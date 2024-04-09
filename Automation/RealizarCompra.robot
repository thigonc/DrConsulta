*** Settings ***
Documentation     Acessa o site     
Resource          ResourcesBDD.robot
Test Setup        Abrir o navegador
# Test Teardown     Fechar o navegador
Library    OperatingSystem

*** Test Cases ***
Caso de Teste 03 -Realizar a compra de um produto por uma das abas do site 
    [Tags]    Compras
    Dado Acessar site
    E Clicar SignIn
    E Logar com Email e senha cadastrados
    Quando Acessar aba T-shirts
    E Escolher um produto e adicionar ao carrinho
    E Validar Produto add ao carrinho
    E Preencher dados de compra
    Então Valida que a compra foi efetuada