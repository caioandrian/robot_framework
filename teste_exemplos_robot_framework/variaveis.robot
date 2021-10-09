*** Settings ***
Documentation   Exemplo de tipos variáveis: ESCALARES, LISTAS, DICIONARIO

*** Variables ***
${EXEMPLO_VAR_ESCALAR}  Eu sou uma variavel escalar!
@{EXEMPLO_VAR_LISTAS}   azul    verde   amarelo     laranja
&{EXEMPLO_VAR_DICIONARIO}   nome=luiz   email=teste@robot.com

*** Test Cases ***
Exemplo de uso de variáveis
    Log To Console      ${EXEMPLO_VAR_ESCALAR}
    Log To Console      ${EXEMPLO_VAR_LISTAS[0]}
    Log To Console      ${EXEMPLO_VAR_LISTAS[3]}
    Log To Console      ${EXEMPLO_VAR_DICIONARIO.nome}
    Log To Console      %{USERNAME}