*** Settings ***
Library     AppiumLibrary

*** Variables ***
${SALDO_DA_CONTA}      xpath=//android.widget.TextView[@text='Conta para saldo']//following::android.widget.TextView

*** Keywords ***
Valida saldo atualizado
    Wait Until Page Contains       Conta para saldo
    ${saldo_antigo}=    Get Text    ${SALDO_DA_CONTA}
    Deslizar tela para cima
    ${soma_valor_antigo}=   Evaluate    ${saldo_antigo} + 2000.50
    ${soma_valor_antigo}=   Convert To String   ${soma_valor_antigo}
    Log To Console  \n${soma_valor_antigo}
    Element Should Contain Text     ${SALDO_DA_CONTA}     ${soma_valor_antigo}