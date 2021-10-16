*** Settings ***
Documentation   Exemplo página de extratos

*** Variables ***
${ICONE_LIXEIRA_MOV}        /../../..//i[@class='far fa-trash-alt']
${ICONE_EDITAR_MOV}         /../../..//i[@class='fas fa-edit']
${LINHAS_MOVIMENTACOES}     class=list-group > li

#valores
${MENSAGEM_SUCESSO_TRANSACAO_EXCLUIDA}        Movimentação removida com sucesso!

*** Keywords ***
Selecionar transação pela descrição
    [ARGUMENTS]     ${descricao}    
    Sleep       5s
    Element Should Be Visible           xpath=//span[text()="${descricao}"]
    Click Element           xpath=//span[text()="${descricao}"]${ICONE_EDITAR_MOV}

Excluir transação pela descrição
    [ARGUMENTS]     ${descricao}
    Sleep       5s
    Element Should Be Visible           xpath=//span[text()="${descricao}"]
    Click Element           xpath=//span[text()="${descricao}"]${ICONE_LIXEIRA_MOV}
    Wait Until Keyword Succeeds      20s     200ms     Valida mensagem de movimentação removida com sucesso

Valida mensagem de movimentação removida com sucesso
    Element Should Be Visible       ${ALERT_MENSAGEM}       20s
    Element Should Contain          ${ALERT_MENSAGEM}       ${MENSAGEM_SUCESSO_TRANSACAO_EXCLUIDA}
    Click Element       ${BTN_CLOSE_MENSAGEM}

Valida a quantidade de transacoes na página
    [ARGUMENTS]     ${qtde}
    ${count} =  Get Element Count   ${LINHAS_MOVIMENTACOES}
    Should Be True  ${count} == ${qtde}

Valida se a movimentação aparece na página
    [ARGUMENTS]     ${descricao}        ${valor}
    Wait Until Page Contains        ${descricao}
    Page Should Contain     ${descricao}
    Element Should Be Visible           xpath=//span[text()='${descricao}']//following-sibling::small[contains(., '${valor}')]
