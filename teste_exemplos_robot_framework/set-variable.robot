*** Settings ***
Documentation   Exemplo do set variables

*** Test Cases ***
Set Variable
    ${msg}=      Set Variable       Oi Mundo!
    Log To Console  \n${msg}

