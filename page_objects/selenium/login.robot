*** Settings ***
Documentation   Exemplo login

*** Variables ***
#campos
${INPUT_EMAIL}      //*[@data-test="email"]
${INPUT_SENHA}      //*[@data-test="passwd"]
${BTN_LOGIN}        class=btn

#valores
${EMAIL}     caio@caio
${SENHA}     123

*** Keywords ***
Fazer login no sistema e resetar banco de dados
    Informar usuário e senha
    Fazer login
    Wait Until Keyword Succeeds      20s     200ms     Valida mensagem de cliente logado com sucesso
    Resetar banco de dados
    Wait Until Keyword Succeeds      20s     200ms     Valida mensagem de banco de dados resetado com sucesso

Informar usuário e senha
    Input Text      ${INPUT_EMAIL}    ${EMAIL}
    Input Text      ${INPUT_SENHA}    ${SENHA}

Fazer login
    Click Element   ${BTN_LOGIN}

Fechar navegador
    Stop Gif Recording
    Close Browser