*** Settings ***
Documentation  Teste para validar visita no chrome
Resource    ../page_objects/appium-web/base.robot
Resource    ../page_objects/appium-web/visit.robot

Suite Setup     Open Test Application
Test Setup      Run Keywords
...             Launch Application
Test Teardown   Quit Application
Suite Teardown  Run Keywords
...             Stop Gif Recording
...             Close Application

*** Test Cases ***
Valida a visita na pagina
    Acessar página do google
