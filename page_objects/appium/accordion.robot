*** Variables ***
${CONTEUDO_FIXO}        Esta é a descrição da

*** Keywords ***
Escolher opção
    [Arguments]     ${texto}
    Wait Until Page Contains       ${texto}      20s
    Click Text      ${texto}

Valida conteudo do accordion aberto
    [Arguments]     ${texto}
    Sleep   1s
    Page Should Contain Text      Esta é a descrição da ${texto}        20s