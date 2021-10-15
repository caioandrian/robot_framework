
 Exemplos usando robot framework com selenium e appium

# Curso Robot Framework Udemy
Conteúdo básico do curso + testes adicionais.
* Nome do Curso: Testes Automatizados Usando Robot Framework – Módulo 1

<br/>

### ---- Pré-Requisitos Robot com Selenium Library ----
- Sistema Operacional Windows
- Download da Linguagem Python (https://www.python.org/downloads/)
- Marcar opção de instalar o PIP durante instalação do Python
- python --version
- pip --version
- Download do Robot Framework via linha de comando no terminal: pip install robotframework
- robot --version
- Download do Selenium Library: pip install robotframework-seleniumlibrary
- Download do Geckodriver: https://github.com/mozilla/geckodriver/releases
- Download do chrome driver (https://chromedriver.chromium.org/downloads)
- Salvar ambos os arquivos executáveis (geckodriver e chrome driver), dentro da pasta scripts onde foi instalado o Python na sua máquina.
<br/>

### ---- Pré-Requisitos Robot com Appium Library ----
- Instalação e Configuração: https://www.youtube.com/watch?v=W5hcHbzTjOc
- Java jdk8, Android Studio, Java SDK, Variáveis de ambiente do sistema, webdriver.io (dependência)
- importante: atualizar a variável de ambiente de %ANDROID_HOME%/build-tools para %ANDROID_HOME%\platform-tools
- iniciar o device pelo AVD Manager do Android Studio.
- comandos para iniciar a ligação com o appium: appium, adb kill-server, adb start-server, adb-devices
- videos adicionais de ajuda: https://www.youtube.com/watch?v=QYT0_qgkiCw / https://www.youtube.com/watch?v=0a5NAJjUBbA
<br/>

#### **Página e APP usados durante os testes**:
- website: https://barrigareact.wcaquino.me
- app: CTAppium_1_0 (disponível na pasta resources)

#### **Bibliotecas do Robot**:
- Selenium Library
- Appium Library (em breve)

<br/>

### ---- Lista de Testes com Selenium ----
<br/>

- Criar uma conta
- Login inválido **(esquema de cenário)**
- CRUD de movimentações/transações

<br/>

### ---- Lista de Testes com Appium ----
<br/>

- Interação com abas, alertas, accordion, cliques longo e normal, scroll (up, down, left, right), swipe de elementos, formulário.
- Exemplo usando e2e usando uma aplicação nativa (a apk está na pasta resources - ctAppium)
- Exemplo acessando aplicação híbrida (troca de contexto para webview)
- Obs: Talvez precise atualizar a versão do chromedrive de acordo com a versão do seu navegador no device simulado
- ~~Drag and Drop, não funcionou~~ :pensive:
<br/>

### ---- Diferenciais no projeto ----
<br/>

- Page Object
- Robot Framework
- Selenium Library
- Appium Library
- Massa de Dados / Data Driven
- Geração de Report
- Contexto Webview para mobile (aplicação híbrida)

<br/>

### ---- Lista de Comandos: ----

**Instalar dependências via node**
> npm i

**Executar todos testes de exemplo do robot framework**
> npm run robot:exemplos

<br/>

### ---- Comandos para rodar os testes com Selenium: ----

<br/>

**Executar todos testes com selenium webdriver**
> npm run robot:selenium

**Executar todos testes com massa de dados**
> npm run robot:selenium-login_invalido

<br/>

*Acesse o arquivo package.json para ver todos os comandos disponíveis.*

<br/>

### ---- Comandos para rodar testes com Appium: ----

<br/>

*Observação: Para executar os testes com appium é preciso antes inicializar o device pelo AVD Manager no Android Studio.*

<br/>

**Iniciar o appium**
> appium

**Iniciar o ADB**
> adb start-server

**Executar todos testes com appium**
> npm run robot:appium

**Executar teste e2e com aplicação nativa**
> npm run robot:appium-aplicacao-nativa

**Executar teste com aplicação híbrida**
> npm run robot:appium-aplicacao-hibrida

<br/>

*Acesse o arquivo package.json para ver todos os comandos disponíveis.*

<br/>

**Comando para visualizar a tela e inspecionar elementos**
> uiautomatorviewer