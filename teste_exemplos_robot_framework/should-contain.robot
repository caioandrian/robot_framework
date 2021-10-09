*** Settings ***
Documentation   Exemplo do Should Contain

*** Test Cases ***
Should be contain
    ${msg}=      Set Variable       Empregado cadastrado com sucesso!
    Should Contain         ${msg}       Empregado

Should be contain com Listas!
    ${cores}=      Create List       azul     amarelo     laranja     verde
    Should Contain         ${cores}       vermelho      msg="A cor Vermelha não está na lista"

