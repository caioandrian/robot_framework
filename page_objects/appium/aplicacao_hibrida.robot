*** Variables ***
${CONTEXTO_WEBVIEW}      class=android.webkit.WebView

${INPUT_WEBVIEW_LOGIN}    id=email
${INPUT_WEBVIEW_SENHA}    id=senha
${BTN_WEBVIEW_ENTRAR}     //button[@type='submit']

*** Keywords ***
Trocar para contexto WEBVIEW
    Wait Until Page Contains Element    ${CONTEXTO_WEBVIEW}
    Sleep   1s
    ${contextos}=    Get Contexts
    Log To Console  \n${contextos}
    Switch To Context   WEBVIEW_com.ctappium
    ${contexto_atual}=    Get Current Context
    Log To Console      ${contexto_atual}

Fazer login na aplicacao hÍbrida
    [Arguments]     ${login}     ${senha}
    Wait Until Page Contains Element      ${INPUT_WEBVIEW_LOGIN}
    Input Text      ${INPUT_WEBVIEW_LOGIN}      ${login}
    Input Text      ${INPUT_WEBVIEW_SENHA}      ${senha}
    Click Element   ${BTN_WEBVIEW_ENTRAR}
    Capture Page Screenshot