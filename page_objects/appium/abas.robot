*** Variables ***
${CONTEUDO_ABA1}    Este é o conteúdo da Aba 1
${CONTEUDO_ABA2}    Este é o conteúdo da Aba 2
${MENU_ABA2}        ABA 2

*** Keywords ***
Valida conteudo da Aba 1
    Page Should Contain Text      ${CONTEUDO_ABA1}      20s

Acessar Aba 2
    Click Text      ${MENU_ABA2}

Valida conteudo da Aba 2
    Wait Until Keyword Succeeds     20s     200ms   Acessar Aba 2
    Page Should Contain Text      ${CONTEUDO_ABA2}      20s