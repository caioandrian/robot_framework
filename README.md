
 Exemplos usando robot framework com selenium e appium

# Curso Robot Framework Udemy
Conteúdo básico do curso + testes adicionais.
* Nome do Curso: Testes Automatizados Usando Robot Framework – Módulo 1

<br/>

### ---- Pré-Requisitos ----
- Sistema Operacional Windows
- Download da Linguagem Python (https://www.python.org/downloads/)
- Marcar opção de instalar o PIP durante instalação do Python
- python --version
- pip --version
- Download do Robot Framework via linha de comando no terminal: pip install robotframework
- robot --version
- Download so Selenium Library: pip install robotframework-seleniumlibrary
- Download do Geckodriver: https://github.com/mozilla/geckodriver/releases
- Download do chrome driver (https://chromedriver.chromium.org/downloads)
- Salvar ambos os arquivos executáveis (geckodriver e chrome driver), dentro da pasta scripts onde foi instalado o Python na sua máquina.
<br/>

#### **Página e APP usados durante os testes**:
- website: https://barrigareact.wcaquino.me
- app: (em breve)

#### **Bibliotecas do Robot**:
- Selenium Library
- Appium Library (em breve)

<br/>

### ---- Lista de Funcionalidades (Selenium) ----
<br/>

- Criar uma conta
- Login inválido **(esquema de cenário)**
- CRUD de movimentações/transações

<br/>

### ---- Diferenciais no projeto ----
<br/>

- Page Object
- Robot Framework
- Selenium Webdriver
- Massa de Dados / Data Driven
- Report

<br/>

### ---- Gerenciador de pacotes NPM (OPCIONAL) ----
A utilização do NPM é opcional, portanto, você pode ignorar os passos abaixo e excluir os arquivos package.json, package-lock.json do projeto. Caso tenha optado por ignorar a utilização do NPM, será preciso rodar os comandos de execução dos testes como no exemplo: <robot -d ./results ./teste_selenium/selenium.robot>.
<br/>

**Instalar dependências via node**
> npm i (apenas para criar a pasta node_modules)

**Executar todos testes com selenium webdriver**
> npm run robot:selenium

**Executar todos testes com massa de dados**
> npm run robot:login_invalido

**Executar todos testes de exemplo do robot framework**
> npm run robot:exemplos

<br/>

### ---- Próximos Testes ----
Testes para app / mobile com appium library
