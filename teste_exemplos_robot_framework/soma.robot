*** Settings ***
Documentation   Exemplo de uso da keyword para soma (Evaluate)

*** Test Cases ***
Operador de Soma
    ${ns}=   Create Dictionary      x=${4}   y=${2}
    ${resultado}=   Evaluate    x+y     namespace=${ns}
    
    Log To Console  \n${resultado}