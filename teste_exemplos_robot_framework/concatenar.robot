*** Settings ***
Documentation   Exemplo de uso do catenate

*** Test Cases ***
Concatenar
    ${str1}=   Catenate     Hello           World
    ${str2}=   Catenate     SEPARATOR=---   Hello     World
    ${str3}=   Catenate     SEPARATOR=  Hello     World
    
    Log To Console  \n${str1}
    Log To Console  \n${str2}
    Log To Console  \n${str3}
