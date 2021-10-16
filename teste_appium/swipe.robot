*** Settings ***
Documentation  Teste para validar swipe
Resource    ../page_objects/appium/base.robot
Resource    ../page_objects/appium/menu.robot
Resource    ../page_objects/appium/swipe.robot

Suite Setup     Open Test Application
Test Setup      Run Keywords
...             Launch Application      AND
...             Valida se a tela principal está visível
Test Teardown   Quit Application
Suite Teardown  Run Keywords
...             Stop Gif Recording
...             Close Application

*** Test Cases ***
Fazer swipe simples as para laterais
    Acessar menu    Swipe
    Valida conteudo da página       a esquerda
    Deslizar tela para direita
    Valida conteudo da página       E veja se
    Clicar no botão para direita
    Valida conteudo da página       Chegar até o fim!
    Clicar no botão para esquerda
    Deslizar tela para esquerda
    Valida conteudo da página       a esquerda

Fazer swipe desafio técnico
    Deslizar tela para baixo
    Acessar menu    Swipe List
    Deslizar para o lado direito o elemento    Opção 1
    Clicar no botão +
    Valida conteudo da página       Opção 1 (+)
    Deslizar para o lado direito o elemento     Opção 4
    Clicar no botão +
    Valida conteudo da página       Opção 4 (+)
    Deslizar para o lado direito o elemento      Opção 6 (+)
    Clicar no botão -
    Valida conteudo da página       Opção 6 (-)
    