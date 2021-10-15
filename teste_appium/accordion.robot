*** Settings ***
Documentation  Teste para validar o accordion
Resource    ../page_objects/appium/base.robot
Resource    ../page_objects/appium/menu.robot
Resource    ../page_objects/appium/accordion.robot

Suite Setup     Open Test Application
Test Setup      Run Keywords
...             Launch Application      AND
...             Valida se a tela principal está visível
Test Teardown   Quit Application
Suite Teardown  Close Application

*** Test Cases ***
Valida a interação com accordion
    Acessar menu    Accordion
    Escolher opção      Opção 1
    Valida conteudo do accordion aberto     opção 1
