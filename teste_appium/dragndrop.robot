*** Settings ***
Documentation  Teste para validar drag n drop
Resource    ../page_objects/appium/base.robot
Resource    ../page_objects/appium/menu.robot

Suite Setup     Open Test Application
Test Setup      Run Keywords
...             Launch Application      AND
...             Valida se a tela principal está visível
Test Teardown   Quit Application
Suite Teardown  Close Application

*** Test Cases ***
Arrastar um elemento até o outro
    Deslizar tela para baixo
    Acessar menu    Drag and drop
    #Arrastar um elemento até o outro elemento       Esta        e arraste para
    # Não encontrei uma forma de fazer o drag n drop....