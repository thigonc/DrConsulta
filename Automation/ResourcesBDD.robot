*** Settings ***
Resource          Resources.robot

*** Keywords ***
Dado Acessar site
    Acessar site

E Clicar SignIn
    Clicar SignIn

Quando Preencher Email
    Preencher Email
E Preencher informacoes
    Preencher informacoes
Então Valida que foi cadastrado com sucesso
    Valida que foi cadastrado com sucesso

Quando Preencher Email ja existente
    Preencher Email ja existente

Então Validar que o Email ja esta cadastrado
    Validar que o Email ja esta cadastrado

 E Logar com Email e senha cadastrados
    Logar com Email e senha cadastrados

Quando Acessar aba T-shirts
    Acessar aba T-shirts

E Escolher um produto e adicionar ao carrinho
    Escolher um produto e adicionar ao carrinho

E Validar Produto add ao carrinho
    Validar Produto add ao carrinho

E Preencher dados de compra
    Preencher dados de compra

Então Valida que a compra foi efetuada
    Valida que a compra foi efetuada