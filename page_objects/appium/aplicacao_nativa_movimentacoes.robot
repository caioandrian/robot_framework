*** Settings ***
Library  AppiumLibrary
Library     DateTime

*** Variables ***
${APLICACAO_MENU_SUPERIOR}      class=android.widget.HorizontalScrollView
${APLICACAO_MENU_MOVIMENTACOES}   //*[@text='MOV...']

#FORM MOVIMENTACAO
${FRAME_DATA}       class=android.widget.FrameLayout
${FRAME_HORARIO}    id=android:id/time_header
${APLICACAO_FORM_MOV_STATUS}       class=android.widget.Switch
${BTN_MES_ANTERIOR}     id=android:id/prev
${TXT_BTN_SALVAR}       //*[@text='SALVAR']
${BTN_OK_FORM_DATA}     id=android:id/button1
${APLICACAO_MOV_INPUT_DESCRICAO}      //*[@text='Descrição']
${APLICACAO_MOV_INPUT_INTERESSADO}      //*[@text='Interessado']
${APLICACAO_MOV_INPUT_VALOR}      //*[@text='Valor']
${APLICACAO_MOV_SELECT_CONTA}      xpath=//android.widget.TextView[@text='Selecione uma conta...']

${MENSAGEM_MOVIMENTACAO_CADASTRADA_SUCESSO}     Movimentação cadastrada com sucesso

*** Keywords ***
Acessar aba movimentações da aplicação
    Wait Until Page Contains Element    ${APLICACAO_MENU_SUPERIOR}      20s
    Click Element       ${APLICACAO_MENU_MOVIMENTACOES}

Alterar status da movimentação
    Wait Until Page Contains Element    ${APLICACAO_FORM_MOV_STATUS}    20s
    Click Element   ${APLICACAO_FORM_MOV_STATUS}
    Valida atributo do elemento     ${APLICACAO_FORM_MOV_STATUS}         checked     true

Selecionar data da movimentação
    ${data_formatada}=      Get Current Date        result_format=%d/%m/%Y
    Wait Until Page Contains       ${data_formatada}
    Click Text      ${data_formatada}

Selecionar data do pagamento
    ${data_formatada}=      Get Current Date        result_format=%d/%m/%Y
    Wait Until Page Contains       ${data_formatada}
    Click Text      ${data_formatada}

Escolher o dia
    [Arguments]     ${dia}
    Wait Until Page Contains Element       ${FRAME_DATA}
    Click Element   xpath=//android.view.View[@text='${dia}']
    Sleep   1s

Escolher o mês anterior
    Wait Until Page Contains Element       ${BTN_MES_ANTERIOR}
    Click Element   ${BTN_MES_ANTERIOR}

Preencher a descrição da movimentação
    [Arguments]     ${desc}
    Input Text  ${APLICACAO_MOV_INPUT_DESCRICAO}    ${desc}

Preencher o interessado da movimentação
    [Arguments]     ${interessado}
    Input Text  ${APLICACAO_MOV_INPUT_INTERESSADO}    ${interessado}

Preencher o valor da movimentação
    [Arguments]     ${valor}
    Input Text  ${APLICACAO_MOV_INPUT_VALOR}    ${valor}

Selecionar a conta da movimentação
    [Arguments]     ${conta}
    Wait Until Page Contains Element       ${APLICACAO_MOV_SELECT_CONTA}
    Click Element       ${APLICACAO_MOV_SELECT_CONTA}
    Wait Until Page Contains        ${conta}
    Click Text      ${conta}

Salvar data
    Click Element   ${BTN_OK_FORM_DATA}

Salvar movimentação
    Wait Until Page Contains Element       ${TXT_BTN_SALVAR}
    Click Element   ${TXT_BTN_SALVAR}

Valida campos obrigatórios
    Valida mensagem de campo obrigatório    Descrição
    Preencher a descrição da movimentação    prêmio da loteria
    Salvar movimentação
    Valida mensagem de campo obrigatório    Interessado
    Preencher o interessado da movimentação     Eu mesmo
    Salvar movimentação
    Valida mensagem de campo obrigatório    Valor
    Preencher o valor da movimentação     2000,50
    Salvar movimentação
    Valida mensagem de campo obrigatório    Conta
    Selecionar a conta da movimentação     Conta para saldo

Valida mensagem de campo obrigatório
    [Arguments]     ${campo}
    Wait Until Page Contains    ${campo} é um campo obrigatório       20s
    Page Should Contain Text    ${campo} é um campo obrigatório 

Valida mensagem de movimentação cadastrada com sucesso
    Wait Until Page Contains    ${MENSAGEM_MOVIMENTACAO_CADASTRADA_SUCESSO}       20s
    Page Should Contain Text    ${MENSAGEM_MOVIMENTACAO_CADASTRADA_SUCESSO} 