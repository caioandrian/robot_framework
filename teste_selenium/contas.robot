*** Settings ***
Documentation    Testes para validar o cadastrado de novas contas.
Resource    ../page_objects/selenium/login.robot
Resource    ../page_objects/selenium/head.robot
Resource    ../page_objects/selenium/contas.robot

Suite Setup     Abrir navegador na página de exemplo
Test Setup      Fazer login no sistema e resetar banco de dados
Test Teardown       Fazer logout do sistema
Suite Teardown      Fechar navegador

*** Test Cases ***
Criar uma conta com nome válido
    Acessar página de contas
    Adicionar conta     Carteira
    Valida mensagem de conta cadastrada com sucesso
    Valida se o nome da conta inserida esta aparecendo      Carteira

Criar uma conta com nome que já existe
    Acessar página de contas
    Adicionar conta     Carteira
    Adicionar conta     Carteira
    Valida mensagem de erro conta duplicada