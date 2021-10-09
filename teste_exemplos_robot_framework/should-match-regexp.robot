*** Settings ***
Documentation   Exemplo do regexp

*** Test Cases ***
Uso do regexp
    ${numero}=      Set Variable       123778
    Should Match Regexp      ${numero}       ^\\d{6}$

