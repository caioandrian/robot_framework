*** Settings ***
Documentation    Exemplo usando massa de dados
...              para validar o login com dados inválidos
Library     SeleniumLibrary     run_on_failure=Nothing
Resource    ../page_objects/selenium/login.robot
Resource    ../page_objects/selenium/head.robot
Resource    ../page_objects/selenium/contas.robot

Suite Setup         Abrir navegador na página de exemplo
Suite Teardown      Fechar navegador
Test Template       Login com credenciais inválidas devem falhar

*** Variables ***
${EMAIL_VALIDO}    caio@caio
${SENHA_VALIDA}    qualquersenha

*** Test Cases ***    EMAIL             SENHA               MSG_STATUS_CODE
Dados Vazios        ${EMPTY}             ${EMPTY}               Bem vindo, !
Email Vazio         ${EMPTY}             ${SENHA_VALIDA}        401
Senha Vazia         ${EMAIL_VALIDO}      ${EMPTY}               401
Email Inválido      email_invalido_1     ${SENHA_VALIDA}        400
Senha Inválida      ${EMAIL_VALIDO}      senha_incorreta        401
Dados Inválidos     email_invalido_2     teste                  400

*** Keywords ***
Login com credenciais inválidas devem falhar
    [Arguments]    ${email}    ${senha}     ${msg_status_code}
    Sleep   1s
    Input Text      ${INPUT_EMAIL}    ${email}      clear=True
    Input Text      ${INPUT_SENHA}    ${senha}      clear=True
    Sleep   1s
    Click Element   ${BTN_LOGIN}
    Wait Until Keyword Succeeds      30s     500ms     Valida mensagem de login inválido    ${msg_status_code}