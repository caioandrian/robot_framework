*** Settings ***
Documentation  Teste para validar diferentes cliques
Resource    ../page_objects/appium/base.robot
Resource    ../page_objects/appium/menu.robot
Resource    ../page_objects/appium/cliques.robot

Suite Setup     Open Test Application
Test Setup      Run Keywords
...             Launch Application      AND
...             Valida se a tela principal está visível
Test Teardown   Quit Application
Suite Teardown  Close Application

*** Test Cases ***
Faz uma interação de clique longo
    Acessar menu    Cliques
    Fazer um clique longo no botão
    Valida se o texto apareceu no elemento após o clique       Clique Longo

Faz uma interação de clique duplo
    Acessar menu    Cliques
    Fazer um clique duplo no botão
    Valida se o texto apareceu no elemento após o clique       Duplo Clique
