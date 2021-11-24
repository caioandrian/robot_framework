*** Settings ***
Documentation       Page object calculadora desktop

*** Variables ***
${BTN_0}     accessibility_id=num0Button
${BTN_1}     accessibility_id=num1Button
${BTN_2}     accessibility_id=num2Button
${BTN_3}     accessibility_id=num3Button
${BTN_4}     accessibility_id=num4Button
${BTN_5}     accessibility_id=num5Button
${BTN_6}     accessibility_id=num6Button
${BTN_7}     accessibility_id=num7Button
${BTN_8}     accessibility_id=num8Button
${BTN_9}     accessibility_id=num9Button
${BTN_SUBTRAIR}         accessibility_id=minusButton
${BTN_SOMAR}            accessibility_id=plusButton
${BTN_IGUAL}            accessibility_id=equalButton
${BTN_LIMPAR}           accessibility_id=clearButton
${RESULTADO}            accessibility_id=CalculatorResults

*** Keywords ***
Somar 2 mais 30
    Wait For And Click Element       ${BTN_2}
    Wait For And Click Element       ${BTN_SOMAR}
    Wait For And Click Element       ${BTN_3}
    Wait For And Click Element       ${BTN_0}
    Wait For And Click Element       ${BTN_IGUAL}

Somar 101 mais 99
    Wait For And Click Element       ${BTN_1}
    Wait For And Click Element       ${BTN_0}
    Wait For And Click Element       ${BTN_1}
    Wait For And Click Element       ${BTN_SOMAR}
    Wait For And Click Element       ${BTN_9}
    Wait For And Click Element       ${BTN_9}
    Wait For And Click Element       ${BTN_IGUAL}

Subtrair 5 menos 5
    Wait For And Click Element       ${BTN_5}
    Wait For And Click Element       ${BTN_SOMAR}
    Wait For And Click Element       ${BTN_5}
    Wait For And Click Element       ${BTN_IGUAL}

Subtrair -67 menos 23
    Wait For And Click Element       ${BTN_SUBTRAIR}
    Wait For And Click Element       ${BTN_6}
    Wait For And Click Element       ${BTN_3}
    Wait For And Click Element       ${BTN_SUBTRAIR}
    Wait For And Click Element       ${BTN_2}
    Wait For And Click Element       ${BTN_3}
    Wait For And Click Element       ${BTN_IGUAL}

Limpar operação
    Wait For And Click Element       ${BTN_LIMPAR}

Valida resultado apresentado
    [ARGUMENTS]     ${valorEsperado}
    Wait Until Element Contains       ${RESULTADO}     ${valorEsperado}
    