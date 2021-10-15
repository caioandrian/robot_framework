*** Settings ***
Documentation  Teste para validar scroll
Resource    ../page_objects/appium/base.robot
Resource    ../page_objects/appium/menu.robot
Resource    ../page_objects/appium/alertas.robot

Suite Setup     Open Test Application
Test Setup      Run Keywords
...             Launch Application      AND
...             Valida se a tela principal está visível
Test Teardown   Quit Application
Suite Teardown  Close Application

*** Test Cases ***
Encontrar a opção escondida no menu
    Deslizar tela para baixo
    Valida se o texto está visível      Opção bem escondida
    Acessar menu    Opção bem escondida
    Valida mensagem do alerta        Você achou essa opção