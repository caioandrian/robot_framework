*** Settings ***
Library     SeleniumLibrary     run_on_failure=Nothing
Library     OperatingSystem
Documentation   Exemplo página de movimentação / transação

*** Variables ***
${INPUT_MOV_DESCRICAO}       id=descricao
${INPUT_MOV_VALOR}       //*[@data-test="valor"]
${INPUT_MOV_INTERESSADO}       //*[@data-test="envolvido"]
${SELECT_MOV_CONTA}       //*[@data-test="conta"]
${BTN_STATUS}       //*[@data-test="status"]
${BTN_SALVAR_MOVIMENTACAO}       class=btn-primary

#valores
${MENSAGEM_SUCESSO_MOVIMENTACAO_CADASTRADA}        Movimentação inserida com sucesso!
${MENSAGEM_SUCESSO_MOVIMENTACAO_ALTERADA}        Movimentação alterada com sucesso!

*** Keywords ***
Adicionar movimentacao
    [ARGUMENTS]     ${descricao}     ${valor}       ${interessado}        ${nome_conta}
    Input Text      ${INPUT_MOV_DESCRICAO}      ${descricao}
    Input Text      ${INPUT_MOV_VALOR}      ${valor}
    Input Text      ${INPUT_MOV_INTERESSADO}      ${interessado}
    Select From List By Label      ${SELECT_MOV_CONTA}      ${nome_conta}
    Click Element       ${BTN_SALVAR_MOVIMENTACAO}
    Wait Until Keyword Succeeds      20s     200ms     Valida mensagem de movimentação cadastrada com sucesso

Editar movimentação
    [ARGUMENTS]     ${descricao}        ${nome_conta}
    Sleep   10s
    Element Attribute Value Should Be       ${INPUT_MOV_DESCRICAO}      value        ${descricao}
    Click Element      ${BTN_STATUS}
    Wait Until Page Contains Element        ${BTN_STATUS}\[contains(@class, "btn-success")]
    Click Element       ${BTN_SALVAR_MOVIMENTACAO}
    Wait Until Keyword Succeeds      20s     200ms     Valida mensagem de movimentação alterada com sucesso

Valida mensagem de movimentação cadastrada com sucesso
    Element Should Be Visible       ${ALERT_MENSAGEM}       20s
    Element Should Contain          ${ALERT_MENSAGEM}       ${MENSAGEM_SUCESSO_MOVIMENTACAO_CADASTRADA}
    Click Element       ${BTN_CLOSE_MENSAGEM}

Valida mensagem de movimentação alterada com sucesso
    Element Should Be Visible       ${ALERT_MENSAGEM}       20s
    Element Should Contain          ${ALERT_MENSAGEM}       ${MENSAGEM_SUCESSO_MOVIMENTACAO_ALTERADA}
    Click Element       ${BTN_CLOSE_MENSAGEM}