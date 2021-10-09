*** Settings ***
Library     SeleniumLibrary     run_on_failure=Nothing
Library     OperatingSystem
Documentation   Exemplo cabeçalho da página

*** Variables ***
${ALERT_MENSAGEM}      class=toast-message
${BTN_CLOSE_MENSAGEM}        class=toast-close-button

#campos
${SETTINGS}     //*[@data-test="menu-settings"]
${CONTAS}       //*[@href="/contas"]
${RESETAR}      //*[@href="/reset"]
${MOVIMENTACAO}         //*[@data-test="menu-movimentacao"]
${HOME}         //*[@data-test="menu-home"]
${EXTRATO}      //*[@data-test="menu-extrato"]
${SAIR}         //*[@href="/logout"]

#valores
${MENSAGEM_LOGADO_SUCESSO}        Bem vindo
${MENSAGEM_BANCO_RESETADO_SUCESSO}        Dados resetados com sucesso!
${MENSAGEM_DESLOGADO_SUCESSO}        Até Logo!

*** Keywords ***
Resetar banco de dados
    Wait Until Element Is Visible       ${SETTINGS}     20s
    Click Element       ${SETTINGS}
    Wait Until Element Is Visible       ${RESETAR}      20s
    Click Element       ${RESETAR}

Fazer logout do sistema
    Run Keyword If Test Failed      Print da tela com erro
    Wait Until Element Is Visible       ${SETTINGS}     20s
    Click Element       ${SETTINGS}
    Wait Until Element Is Visible       ${SAIR}     20s
    Click Element       ${SAIR}
    Wait Until Keyword Succeeds      20s     200ms    Valida mensagem de deslogado com sucesso

Acessar página home
    Wait Until Element Is Visible       ${SETTINGS}     20s
    Click Element       ${SETTINGS}
    Wait Until Element Is Visible       ${HOME}     20s
    Click Element       ${HOME}

Acessar página de contas
    Wait Until Element Is Visible       ${SETTINGS}     20s
    Click Element       ${SETTINGS}
    Wait Until Element Is Visible       ${CONTAS}     20s
    Click Element       ${CONTAS}

Acessar página de extratos
    Wait Until Element Is Visible       ${SETTINGS}     20s
    Click Element       ${SETTINGS}
    Wait Until Element Is Visible       ${EXTRATO}     20s
    Click Element       ${EXTRATO}

Acessar página de movimentacao
    Wait Until Element Is Visible       ${SETTINGS}     20s
    Click Element       ${SETTINGS}
    Wait Until Element Is Visible       ${MOVIMENTACAO}     20s
    Click Element       ${MOVIMENTACAO}

Valida mensagem de cliente logado com sucesso
    Element Should Be Visible       ${ALERT_MENSAGEM}
    Element Should Contain          ${ALERT_MENSAGEM}       ${MENSAGEM_LOGADO_SUCESSO}
    Click Element       ${BTN_CLOSE_MENSAGEM}

Valida mensagem de banco de dados resetado com sucesso
    Element Should Be Visible       ${ALERT_MENSAGEM}
    Element Should Contain          ${ALERT_MENSAGEM}       ${MENSAGEM_BANCO_RESETADO_SUCESSO}
    Click Element       ${BTN_CLOSE_MENSAGEM}

Valida mensagem de deslogado com sucesso
    Element Should Be Visible       ${ALERT_MENSAGEM}
    Element Should Contain          ${ALERT_MENSAGEM}       ${MENSAGEM_DESLOGADO_SUCESSO}
    Click Element       ${BTN_CLOSE_MENSAGEM}

Valida mensagem de login inválido
    [ARGUMENTS]     ${status_code}
    Element Should Be Visible       ${ALERT_MENSAGEM}
    Element Should Contain          ${ALERT_MENSAGEM}       ${status_code}
    Click Element       ${BTN_CLOSE_MENSAGEM}

Print do elemento na página
    [ARGUMENTS]     ${elemento}
    Capture Element Screenshot      ${elemento}        ${TEST NAME}.png

Print da tela com erro
    Capture Page Screenshot     ${TEST NAME}.png