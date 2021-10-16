*** Settings ***
Documentation  Teste para validar preenchimento de formulário
Resource    ../page_objects/appium/base.robot
Resource    ../page_objects/appium/menu.robot
Resource    ../page_objects/appium/formulario.robot

Suite Setup     Open Test Application
Test Setup      Run Keywords
...             Launch Application      AND
...             Valida se a tela principal está visível
Test Teardown   Quit Application
Suite Teardown  Run Keywords
...             Stop Gif Recording
...             Close Application

*** Test Cases ***
Interagir com campo de texto, checkbox e switch
    Acessar menu    Formulário
    Preencher o nome   Caio
    Valida o nome apresentado   Caio
    Valida status do checkbox   false
    Clicar no checkbox
    Valida status do checkbox   true
    Valida status do switch   true
    Clicar no switch
    Valida status do switch   false

Interagir com select e seek bar
    Acessar menu    Formulário
    Selecionar um console na lista     Nintendo Switch
    Valida console escolhido    Nintendo Switch
    Definir um valor para o seekbar       0.86
    Clicar em salvar
    Valida valor salvo no seekbar       Slider: 86

Interagir com data e horário
    Acessar menu    Formulário
    Selecionar nova data
    Escolher o dia     20
    Confirmar nova data
    Valida se o texto está visível      20/2/2000
    Selecionar novo horário
    Escolher a hora    22
    Escolher o minuto    30
    Confirmar novo horário
    Valida se o texto está visível      22:30