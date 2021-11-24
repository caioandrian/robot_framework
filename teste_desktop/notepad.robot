*** Settings ***
Documentation    Testes Notepad com Zoomba
Resource    ../page_objects/zoomba_desktop/base.robot
Resource    ../page_objects/zoomba_desktop/notepad.robot

Suite Setup     Start Notepad
Test Setup      Run Keywords
...             Launch Application
...             Setup Test ScreenCapLibrary Notepad
Test Teardown   Run Keywords
...             Quit Application
...             Stop Gif Recording
Suite Teardown  Driver Teardown
Force Tags      Windows

*** Test Cases ***
Escrever uma frase
    Escrever uma frase de exemplo      Essa frase é um teste do robot framework.
    Valida se a frase está aparecendo no arquivo    Essa frase é um teste do robot framework.