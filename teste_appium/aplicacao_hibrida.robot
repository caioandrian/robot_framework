*** Settings ***
Documentation  Teste para validar interação com uma aplicação hÍbrida / webview
Resource    ../page_objects/appium/base.robot
Resource    ../page_objects/appium/menu.robot
Resource    ../page_objects/appium/aplicacao_hibrida.robot

Suite Setup     Open Test Application
Test Setup      Run Keywords
...             Launch Application      AND
...             Valida se a tela principal está visível
Test Teardown   Run Keywords
...             Quit Application
Suite Teardown  Close Application

*** Test Cases ***
Fazer login
    Acessar menu    SeuBarriga Híbrido
    Trocar para contexto WEBVIEW
    Fazer login na aplicacao hÍbrida     caio@caio   123
    Valida se o texto está visível      Bem vindo, Caio!
    Capture Page Screenshot