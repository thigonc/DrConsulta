# Instruções para Instalação e Execução dos Testes com Robot Framework

Este repositório contém testes automatizados escritos utilizando o Robot Framework. Siga as instruções abaixo para configurar o ambiente e executar os testes.

## Instalação

Certifique-se de ter o Python e o pip instalados em seu sistema. Em seguida, siga estas etapas:

1. Instalar o Robot Framework

pip install robotframework

2. Verificar se a instalação foi bem-sucedida
    robot --version

3. Verifique se possui o Python
    python --version
    
4. Clone este repositório:
    git clone https://github.com/thigonc/DrConsulta.git

5. Instale a Libraries
    pip install --upgrade robotframework-seleniumlibrary

## Executar os cenarios ##

No terminal digite robot "nome do arquivo".robot