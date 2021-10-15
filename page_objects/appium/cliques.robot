*** Settings ***
Library  AppiumLibrary

*** Variables ***
${BTN_CLIQUE_LONGO}      //*[@text = 'Clique Longo']
${BTN_CLIQUE_DUPLO}     //*[@text = 'Clique duplo']

#//usamos "(.......)" para procurar todos os elementos que possuem essa classe
#//deixando todas ocorrencias em mesmo nivel/camada e retornando a terceira ocorrencia
${SPAN_CONTEUDO_DO_CLIQUE}     xpath=(//android.widget.TextView)[3]

*** Keywords ***
Fazer um clique longo no botão
    Wait Until Page Contains        Clique Longo      20s
    Long Press      ${BTN_CLIQUE_LONGO}

Fazer um clique duplo no botão
    Wait Until Page Contains        Clique Longo      20s
    Tap     ${BTN_CLIQUE_DUPLO}     count=2

Valida se o texto apareceu no elemento após o clique
    [Arguments]     ${texto}
    Wait Until Page Contains Element    ${SPAN_CONTEUDO_DO_CLIQUE}
    ${valorAtual}=      Get Text        ${SPAN_CONTEUDO_DO_CLIQUE}
    Should Be Equal     ${valorAtual}       ${texto}