*** Settings ***
Library     SeleniumLibrary     run_on_failure=Nothing
Library     OperatingSystem
Documentation   Exemplo página de contas

*** Variables ***
${INPUT_NOME_CONTA}         //*[@data-test="nome"]
${BTN_SALVAR_CONTA}         class=btn

#valores
${MENSAGEM_SUCESSO_CONTA_CRIADA}        Conta inserida com sucesso
${MENSAGEM_SUCESSO_CONTA_DUPLICADA}        Request failed with status code 400

*** Keywords ***
Adicionar conta
    [ARGUMENTS]     ${nome_conta}
    Input Text      ${INPUT_NOME_CONTA}       ${nome_conta}     clear=True
    Click Element       ${BTN_SALVAR_CONTA}

Valida mensagem de conta cadastrada com sucesso
    Wait Until Keyword Succeeds      20s     200ms     Valida mensagem conta criada com sucesso

Valida mensagem de erro conta duplicada
    Wait Until Keyword Succeeds      20s     200ms      Valida mensagem conta duplicada

Valida se o nome da conta inserida esta aparecendo
    [ARGUMENTS]     ${nome_conta}
    Wait Until Page Contains        ${nome_conta}
    Page Should Contain     ${nome_conta}

Valida mensagem conta criada com sucesso
    Element Should Be Visible       ${ALERT_MENSAGEM}       20s
    Element Should Contain          ${ALERT_MENSAGEM}       ${MENSAGEM_SUCESSO_CONTA_CRIADA}
    Click Element       ${BTN_CLOSE_MENSAGEM}

Valida mensagem conta duplicada
    Element Should Be Visible       ${ALERT_MENSAGEM}       20s
    Element Should Contain          ${ALERT_MENSAGEM}       ${MENSAGEM_SUCESSO_CONTA_DUPLICADA}
    Click Element       ${BTN_CLOSE_MENSAGEM}

Valida saldo da conta
    [ARGUMENTS]     ${nome_conta}       ${valor}
    Sleep       5s
    Element Should Be Visible       xpath=//td[text()="${nome_conta}"]
    Element Should Contain       xpath=//td[text()="${nome_conta}"]/../td[2]        ${valor}