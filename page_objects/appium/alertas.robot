*** Variables ***
${TXT_ALERT_CONFIRM}      ALERTA CONFIRM
${TXT_ALERT_RESTRITIVO}      ALERTA RESTRITIVO
${TXT_ALERT_SIMPLES}      ALERTA SIMPLES
${TXT_CONFIRMAR}        CONFIRMAR
${TXT_SAIR}        SAIR

*** Keywords ***
Clicar em alerta confirm
    Wait Until Page Contains       ${TXT_ALERT_CONFIRM}      20s
    Click Text      ${TXT_ALERT_CONFIRM}

Clicar em alerta restritivo
    Wait Until Page Contains       ${TXT_ALERT_RESTRITIVO}      20s
    Click Text      ${TXT_ALERT_RESTRITIVO}

Clicar em alerta simples
    Wait Until Page Contains       ${TXT_ALERT_SIMPLES}      20s
    Click Text      ${TXT_ALERT_SIMPLES}

Valida título do alerta
    [Arguments]     ${texto}
    Wait Until Page Contains Element        ${JANELA_ALERTA}        20s
    Element Text Should Be      ${TITULO_ALERTA}         ${texto}

Valida mensagem do alerta
    [Arguments]     ${texto}
    Wait Until Page Contains Element        ${JANELA_ALERTA}        20s
    Element Text Should Be      ${MENSAGEM_ALERTA}         ${texto}

Clicar em confirmar
    Wait Until Page Contains       ${TXT_CONFIRMAR}      20s
    Click Text      ${TXT_CONFIRMAR}

Clicar em sair
    Wait Until Page Contains       ${TXT_SAIR}      20s
    Click Text      ${TXT_SAIR}
    