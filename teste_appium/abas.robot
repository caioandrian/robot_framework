*** Settings ***
Documentation  Teste para validar cliques nas abas
Resource    ../page_objects/appium/base.robot
Resource    ../page_objects/appium/menu.robot
Resource    ../page_objects/appium/abas.robot

Suite Setup     Open Test Application
Test Setup      Run Keywords
...             Launch Application      AND
...             Valida se a tela principal está visível
Test Teardown   Quit Application
Suite Teardown  Run Keywords
...             Stop Gif Recording
...             Close Application

*** Test Cases ***
Valida a interação com abas
    Acessar menu    Abas
    Valida se está na Aba 1
    Valida conteudo da Aba 1
    Acessar Aba 2
    Valida conteudo da Aba 2
