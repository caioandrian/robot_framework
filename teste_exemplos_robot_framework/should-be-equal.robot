*** Settings ***
Documentation   Exemplo do Should Be Equals

*** Test Cases ***
Should be equal
    ${msg}=      Set Variable       Empregado cadastrado com sucesso!
    Should Be Equal         ${msg}      Qualquer Frase       

Should be equal com mensagem personalizada
    ${msg}=      Set Variable       Empregado cadastrado com sucesso!
    Should Be Equal        ${msg}       Qualquer Frase       msg=O teste falhou!!

