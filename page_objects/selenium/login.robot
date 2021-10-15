*** Settings ***
Library     SeleniumLibrary     run_on_failure=Nothing
Library     OperatingSystem
Documentation   Exemplo login

*** Variables ***
${NAVEGADOR_CHROME}    chrome
${NAVEGADOR_CHROMEHEADLESS}     headlesschrome
${URL_PAGINA}      https://barrigareact.wcaquino.me/

${PATH_SCREENSHOTS}     ./results/selenium/screenshots/

#campos
${INPUT_EMAIL}      //*[@data-test="email"]
${INPUT_SENHA}      //*[@data-test="passwd"]
${BTN_LOGIN}        class=btn

#valores
${EMAIL}     caio@caio
${SENHA}     123

*** Keywords ***
Abrir navegador na página de exemplo
    Open Browser    ${URL_PAGINA}      ${NAVEGADOR_CHROME}
    Maximize Browser Window
    Remove files  ${PATH_SCREENSHOTS}/*.png
    Set Screenshot Directory    ${PATH_SCREENSHOTS}
    #Set Selenium Speed  0.5 seconds

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
    Close Browser