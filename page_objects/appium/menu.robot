*** Keywords ***
Acessar menu
    [Arguments]     ${texto}
    Wait Until Page Contains       ${texto}      20s
    Click Text      ${texto}

Valida se está na Aba 1
    Wait Until Page Contains Element        xpath=//android.widget.TextView[@text='ABA 1']      20s
    ${XPATH_ABA_1}    Get Webelement      xpath=//android.widget.TextView[@text='ABA 1']
    Valida atributo do elemento     ${XPATH_ABA_1}      enabled     True