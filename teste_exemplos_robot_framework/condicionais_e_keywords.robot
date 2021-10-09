*** Settings ***
Documentation   Condicionais e Keywords

*** Test Cases ***
Exit For Loop If
    @{cores}=   Create List     azul    verde       amarelo     vermelho    rosa    roxo
    FOR      ${cor}     IN  @{cores}              
        Exit For Loop If    '${cor}' == 'verde'
        Log To Console  ${cor}
    END

Continue For Loop If
    @{cores}=   Create List     a    b      a     b    a    b
    FOR      ${cor}     IN  @{cores}              
        Continue For Loop If    '${cor}' == 'b'
        Log To Console  ${cor}
    END

Condicional
    ${idade}=   Set Variable     66

    IF      ${idade} < 13              
        Tratar de crianças
    ELSE IF      13 <= ${idade} <= 19       
        Tratar de adolescentes
    ELSE IF      20 <= ${idade} <= 60       
        Tratar de adultos
    ELSE
        Tratar de idosos
    END

*** Keywords ***
Tratar de crianças
    Log To Console  \nvai tratar das crianças

Tratar de adolescentes
    Log To Console  \nvai tratar dos adolescentes

Tratar de adultos
    Log To Console  \nvai tratar dos adultos

Tratar de idosos
    Log To Console  \nvai tratar dos idosos