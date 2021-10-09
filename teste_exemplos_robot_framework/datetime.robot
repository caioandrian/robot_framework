*** Settings ***
Library     DateTime
Documentation   Biblioteca DateTime

*** Test Cases ***
Get Current Date
    ${date}=      Get Current Date
    Log To Console      \n${date}
    ${data_formatada}=      Get Current Date        result_format=%d/%m/%Y %H:%M
    Log To Console      \n${data_formatada}

Subtract Date
    ${diff1}=      Subtract Date From Date      2020-05-28      2020-05-25      result_format=verbose
    Log To Console      \n${diff1}