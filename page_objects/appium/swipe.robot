*** Variables ***
${BTN_DIREITA}     xpath=//*[@text = '›']
${BTN_ESQUERDA}    xpath=//*[@text = '‹']
${BTN_MAIS}     xpath=//*[@text='(+)']/..
${BTN_MENOS}     xpath=//*[@text='(-)']/..

*** Keywords ***
Valida conteudo da página
    [Arguments]     ${texto}
    Wait Until Page Contains      ${texto}      20s
    Page Should Contain Text      ${texto}

Clicar no botão para direita
    Wait Until Page Contains Element      ${BTN_ESQUERDA}       20s
    Click Element      ${BTN_DIREITA}

Clicar no botão para esquerda
    Wait Until Page Contains Element    ${BTN_ESQUERDA}       20s
    Click Element      ${BTN_ESQUERDA}

Clicar no botão +
    Wait Until Page Contains Element    ${BTN_MAIS}       20s
    Click Element       ${BTN_MAIS}

Clicar no botão -
    Wait Until Page Contains Element    ${BTN_MENOS}       20s
    Click Element       ${BTN_MENOS}