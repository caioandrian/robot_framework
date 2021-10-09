*** Settings ***
Documentation   Exemplo do get Length

*** Test Cases ***
Get Length
    ${length}=      Get Length      oi mundo!
    Log To Console  \n${length}

    @{list}=    Create List    valor1  valor2  valor3  valor4
    ${length_lista}=    Get Length      ${list}
    Log To Console  \n${length_lista}

