*** Settings ***
Library     String
Documentation   Biblioteca String

*** Test Cases ***
Convert para minusculo
    ${str}=      Convert To Lower Case       TEXTO EM MAISCULO
    Log To Console      \n${str}

Format String
    ${para}=      Format String       Para: {} <{}>      Caio      caioteste@gmail.com
    Log To Console      \n${para}

Get Subtring
    ${str1}=      Get Substring       Texto de Exemplo      1       5
    Log To Console      \n${str1}