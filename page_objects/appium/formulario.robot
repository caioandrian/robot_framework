*** Settings ***
Library  AppiumLibrary

*** Variables ***
${INPUT_FORMULARIO_NOME}      accessibility_id=nome
${OPCAO_COMBO_CONSOLE}      class=android.widget.Spinner
${CHECKBOX}     class=android.widget.CheckBox
${SWITCH}       accessibility_id=switch
${SEEKBAR}      accessibility_id=slid
${TXT_DATA}      01/01/2000
${TXT_HORARIO}      06:00

${FRAME_DATA}       class=android.widget.FrameLayout
${FRAME_HORARIO}    id=android:id/time_header

${TXT_BTN_SALVAR}       SALVAR
${BTN_OK_FORM_DATA}     id=android:id/button1
${BTN_OK_FORM_HORARIO}     xpath=//*[@text='OK']

${RESULTADO_SEEKBAR}     //android.widget.TextView[starts-with(@text, 'Slider:')]

*** Keywords ***
Preencher o nome
    [Arguments]     ${nome}
    Wait Until Page Contains Element    ${INPUT_FORMULARIO_NOME}
    Input Text      ${INPUT_FORMULARIO_NOME}       ${nome}

Clicar no checkbox
    Wait Until Page Contains Element       ${CHECKBOX}
    Click Element       ${CHECKBOX}

Clicar no switch
    Wait Until Page Contains Element       ${SWITCH}
    Click Element       ${SWITCH}

Definir um valor para o seekbar
    [Arguments]     ${valor}
    Wait Until Page Contains Element       ${SEEKBAR}
    #diferenca entre espaco do elemento e a tela
    ${delta}=   Set Variable    50
    ${size_seekbar}=    Get Element Size     ${SEEKBAR}
    ${loc_seekbar}=    Get Element Location     ${SEEKBAR}
    ${xInicial}=    Evaluate    ${loc_seekbar['x']} + ${delta}
    ${x}=   Evaluate    ${xInicial} + (${size_seekbar['width']}-2 * ${delta}) * ${valor}
    ${y}=   Evaluate    ${loc_seekbar['y']} + (${size_seekbar['height']} / 2)
    Click A Point       ${x}       ${y}

Clicar em salvar
    Click Text      ${TXT_BTN_SALVAR}

Selecionar um console na lista
    [Arguments]     ${console}
    Wait Until Page Contains Element       ${OPCAO_COMBO_CONSOLE}
    Click Element       ${OPCAO_COMBO_CONSOLE}
    Wait Until Page Contains        ${console}
    Click Text      ${console}

Selecionar nova data
    Wait Until Page Contains       ${TXT_DATA}
    Click Text      ${TXT_DATA}

Selecionar o dia
    [Arguments]     ${dia}
    Wait Until Page Contains Element       ${FRAME_DATA}
    Click Element   xpath=//*[@text='${dia}']
    Sleep   1s

Selecionar novo horário
    Wait Until Page Contains       ${TXT_HORARIO}
    Click Text      ${TXT_HORARIO}

Escolher a hora
    [Arguments]     ${hora}
    Wait Until Page Contains Element       ${FRAME_HORARIO}
    Click Element   accessibility_id=${hora}
    Sleep   1s

Escolher o minuto
    [Arguments]     ${minuto}
    Wait Until Page Contains Element       ${FRAME_HORARIO}
    Click Element   accessibility_id=${minuto}
    Sleep   1s

Confirmar nova data
    Click Element   ${BTN_OK_FORM_DATA}

Confirmar novo horário
    Click Element   ${BTN_OK_FORM_HORARIO}

Valida o nome apresentado
    [Arguments]     ${nome}
    ${valorAtual}=      Get Text        ${INPUT_FORMULARIO_NOME}
    Should Be Equal     ${valorAtual}       ${nome}

Valida status do checkbox
    [Arguments]     ${status_previsto}
    Wait Until Page Contains Element       ${CHECKBOX}
    ${check}    Get Element Attribute      ${CHECKBOX}      checked
    Should Be Equal      ${check}       ${status_previsto}

Valida status do switch
    [Arguments]     ${status_previsto}
    Wait Until Page Contains Element       ${SWITCH}
    ${check}    Get Element Attribute      ${SWITCH}      checked
    Should Be Equal      ${check}       ${status_previsto}

Valida console escolhido
    [Arguments]     ${console}
    ${valorAtual}=      Get Text        xpath=//android.widget.Spinner/android.widget.TextView
    Should Be Equal     ${valorAtual}       ${console}

Valida valor salvo no seekbar
    [Arguments]     ${valor}
    Wait Until Page Contains Element       ${RESULTADO_SEEKBAR}
    ${valorAtual}=      Get Text        ${RESULTADO_SEEKBAR}
    Should Be Equal     ${valorAtual}       ${valor}