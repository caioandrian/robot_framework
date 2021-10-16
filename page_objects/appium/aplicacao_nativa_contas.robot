*** Variables ***
${INPUT_APLICACAO_LOGIN}      //*[@text='Nome']
${INPUT_APLICACAO_SENHA}     //*[@text='Senha']
${BTN_APLICACAO_LOGIN_ENTRAR}       //*[@text='ENTRAR']

${BTN_RESET_APLICACAO}       //*[@text='RESET']
${TXT_MENSAGEM_DADOS_RESETADOS}       Dados resetados com sucesso!

#FORM CONTA
${INPUT_FORM_NOME_CONTA}     //android.widget.EditText[@text='Conta']
${BTN_SALVAR_CONTA}     //*[@text='SALVAR']
${BTN_EXCLUIR_CONTA}     //*[@text='EXCLUIR']
${TXT_MENSAGEM_CONTA_CRIADA_SUCESSO}       Conta adicionada com sucesso
${TXT_MENSAGEM_CONTA_EXCLUIDA_SUCESSO}       Conta excluída com sucesso
${TXT_MENSAGEM_CONTA_DUPLICADA}       Problemas de comunicação

*** Keywords ***
Fazer login
    [Arguments]     ${login}    ${senha}
    Wait Until Page Contains Element       ${INPUT_APLICACAO_LOGIN}      20s
    Input Text      ${INPUT_APLICACAO_LOGIN}       ${login}
    Input Text      ${INPUT_APLICACAO_SENHA}       ${senha}
    Click Element   ${BTN_APLICACAO_LOGIN_ENTRAR}

Acessar aba da aplicação pelo texto
    [Arguments]     ${aba}
    Wait Until Page Contains Element    xpath=//*[@text='${aba}']      20s
    Click Element      xpath=//*[@text='${aba}']

Inserir nova conta
    [Arguments]     ${nome}
    Wait Until Page Contains Element       ${INPUT_FORM_NOME_CONTA}      20s
    Input Text      ${INPUT_FORM_NOME_CONTA}    ${nome}
    Valida atributo do elemento     ${BTN_SALVAR_CONTA}         enabled     true
    Click Element   ${BTN_SALVAR_CONTA}

Excluir a conta
    [Arguments]     ${nome}
    Wait Until Page Contains Element       xpath=//*[@text='${nome}']      20s
    Long Press      xpath=//*[@text='${nome}']
    Valida atributo do elemento     ${BTN_EXCLUIR_CONTA}         enabled     true
    Click Element   ${BTN_EXCLUIR_CONTA}

Reseta a aplicação
    Acessar aba da aplicação pelo texto    HOME
    Wait Until Page Contains Element       ${BTN_RESET_APLICACAO}      20s
    Click Element   ${BTN_RESET_APLICACAO}
    Valida mensagem dados resetados com sucesso

Valida mensagem conta cadastrada com sucesso
    Wait Until Page Contains    ${TXT_MENSAGEM_CONTA_CRIADA_SUCESSO}       20s
    Page Should Contain Text    ${TXT_MENSAGEM_CONTA_CRIADA_SUCESSO}

Valida mensagem conta excluída com sucesso
    Wait Until Page Contains    ${TXT_MENSAGEM_CONTA_EXCLUIDA_SUCESSO}     20s
    Page Should Contain Text    ${TXT_MENSAGEM_CONTA_EXCLUIDA_SUCESSO}

Valida mensagem já existe uma conta com esse nome
    Wait Until Page Contains    ${TXT_MENSAGEM_CONTA_DUPLICADA}     20s
    Page Should Contain Text    ${TXT_MENSAGEM_CONTA_DUPLICADA}

Valida mensagem dados resetados com sucesso
    Wait Until Page Contains    ${TXT_MENSAGEM_DADOS_RESETADOS}     20s
    Page Should Contain Text    ${TXT_MENSAGEM_DADOS_RESETADOS}