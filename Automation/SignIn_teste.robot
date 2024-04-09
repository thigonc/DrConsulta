*** Settings ***
Documentation     Acessa o site     
Resource          ResourcesBDD.robot
Test Setup        Abrir o navegador
# Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - criação do usuário
    [Tags]  SingIn
    Dado Acessar site
    E Clicar SignIn
    Quando Preencher Email
    E Preencher informacoes
    Então Valida que foi cadastrado com sucesso

Caso de Teste 02 - criação do usuário falha
    [Tags]  SingIn Falha
    Dado Acessar site
    E Clicar SignIn
    Quando Preencher Email ja existente
    Então Validar que o Email ja esta cadastrado