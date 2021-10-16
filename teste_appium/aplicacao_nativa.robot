*** Settings ***
Documentation  Teste para validar interação com uma aplicação nativa
Resource    ../page_objects/appium/base.robot
Resource    ../page_objects/appium/menu.robot
Resource    ../page_objects/appium/aplicacao_nativa_movimentacoes.robot
Resource    ../page_objects/appium/aplicacao_nativa_contas.robot
Resource    ../page_objects/appium/aplicacao_nativa_home.robot

Suite Setup     Open Test Application
Test Setup      Run Keywords
...             Launch Application      AND
...             Valida se a tela principal está visível
Test Teardown   Quit Application
Suite Teardown  Run Keywords
...             Stop Gif Recording
...             Close Application

*** Test Cases ***
Cadastrar e excluir uma nova conta
    Acessar menu    SeuBarriga Nativo
    Fazer Login     caio@caio   123
    Reseta a aplicação
    Acessar aba da aplicação pelo texto    CONTAS
    Inserir nova conta      conta criada na nuvem
    Valida mensagem conta cadastrada com sucesso
    Excluir a conta       conta criada na nuvem
    Valida mensagem conta excluída com sucesso

Conta duplicada
    Acessar menu    SeuBarriga Nativo
    Fazer Login     caio@caio   123
    Reseta a aplicação
    Acessar aba da aplicação pelo texto    CONTAS
    Inserir nova conta      teste
    Valida mensagem conta cadastrada com sucesso
    Inserir nova conta      teste
    Valida mensagem já existe uma conta com esse nome

Cadastrar nova movimentação
    Acessar menu    SeuBarriga Nativo
    Fazer Login     caio@caio   123
    Reseta a aplicação
    Acessar aba movimentações da aplicação
    Alterar status da movimentação
    Selecionar data da movimentação
    Escolher o mês anterior
    Escolher o dia  17
    Salvar a data
    Selecionar data do pagamento
    Escolher o dia  25
    Salvar a data
    Salvar a movimentação
    Valida campos obrigatórios
    Salvar a movimentação
    Valida mensagem de movimentação cadastrada com sucesso
    Acessar aba da aplicação pelo texto    HOME
    Valida saldo atualizado