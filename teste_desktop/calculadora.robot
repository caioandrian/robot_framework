*** Settings ***
Documentation    Testes Calculadora com Zoomba
Resource    ../page_objects/zoomba_desktop/base.robot
Resource    ../page_objects/zoomba_desktop/calculadora.robot

Suite Setup     Start Calculadora   
Test Setup      Run Keywords
...             Launch Application
...             Setup Test ScreenCapLibrary Calculadora
Test Teardown   Run Keywords
...             Quit Application
...             Stop Gif Recording
Suite Teardown  Driver Teardown
Force Tags      Windows

*** Test Cases ***
Operações de soma
    Somar 2 mais 30
    Valida resultado apresentado    32
    Limpar operação
    Somar 101 mais 99
    Valida resultado apresentado    200

Operações de substração
    Subtrair 5 menos 5
    Valida resultado apresentado    0
    Limpar operação
    Subtrair -67 menos 23
    Valida resultado apresentado    -86