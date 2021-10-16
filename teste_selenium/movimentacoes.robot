*** Settings ***
Documentation    Testes para validar o CRUD de movimentações
Resource    ../page_objects/selenium/login.robot
Resource    ../page_objects/selenium/base.robot
Resource    ../page_objects/selenium/contas.robot
Resource    ../page_objects/selenium/extratos.robot
Resource    ../page_objects/selenium/movimentacoes.robot

Suite Setup     Abrir navegador na página de exemplo
Test Setup      Fazer login no sistema e resetar banco de dados
Test Teardown       Fazer logout do sistema
Suite Teardown      Fechar navegador

*** Test Cases ***
Criar nova transação
    Acessar página de contas
    Adicionar conta       Carteira
    Valida mensagem de conta cadastrada com sucesso
    Acessar página de movimentacao
    Adicionar movimentacao       Transação de Exemplo        900.50      Qualquer Pessoa         Carteira
    Valida se a movimentação aparece na página      Transação de Exemplo    900,50
    
Editar transação
    Acessar página de extratos
    Selecionar transação pela descrição     Movimentacao 1, calculo saldo
    Editar movimentação       Movimentacao 1, calculo saldo        conta para saldo
    Acessar página home
    Valida saldo da conta        Conta para saldo        R$ 4.034,00

Excluir transação
    Acessar página de extratos
    Excluir transação pela descrição       Movimentacao para exclusao
    Valida a quantidade de transacoes na página     6