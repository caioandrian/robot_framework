*** Settings ***
Library     OperatingSystem
Library     String
Documentation   Biblioteca OpSystem (Arquivos, massa de dados, pastas, caminho, etc)

*** Test Cases ***
Ler arquivo
    ${conteudo}=        Get File       ${CURDIR}/../dados.txt
    Log To Console  \n${conteudo}

Ler arquivo com for
    ${conteudo}=        Get File       ${CURDIR}/../resources/dados.txt
    @{linhas}=      Split to lines      ${conteudo}
    FOR     ${linha}    IN      @{linhas}
        Log To Console  \n${linha}
    END
