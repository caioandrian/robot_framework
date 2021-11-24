*** Settings ***
Documentation       Page object notepad desktop

*** Variables ***
${EDITOR_TEXTO}     Name=Editor de Texto
${BTN_NAO_SALVAR}   Name=Não Salvar

*** Keywords ***
Escrever uma frase de exemplo
    [ARGUMENTS]     ${mensagem}
    Wait For And Input Text          ${EDITOR_TEXTO}      ${mensagem}

Valida se a frase está aparecendo no arquivo
    [ARGUMENTS]     ${mensagemEsperada}
    Wait Until Element Contains         ${EDITOR_TEXTO}      ${mensagemEsperada}

Fechar Aplicacao
    Quit Application
    Wait For And Click Element          ${BTN_NAO_SALVAR}
    