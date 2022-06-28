*** Settings ***
Library     AppiumLibrary
Library     OperatingSystem
Library     DateTime
Library      ScreenCapLibrary   quality=100

*** Variables ***
#variáveis de configuração
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_WEB}                com.android.browser
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_DEVICENAME}         emulator-5554
${ANDROID_APPPACKAGE}         com.android.browser
${CHROME_DRIVER}              ./resources/chromedriver244.exe
${ANDROID_ACTIVY}             ./resources/chromedriver244.exe

${PATH_SCREENSHOTS}     ./results/appium-web/
${PATH_VIDEOS}     ./results/appium-web/videos/


#variáveis de teste


*** Keywords ***
Open Test Application
    Open Application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
    ...   platformName=${ANDROID_PLATFORM_NAME}     deviceName=${ANDROID_DEVICENAME}
    ...   appActivity=${ANDROID_ACTIVY}      noReset=True
    #...   appPackage=${ANDROID_APPPACKAGE} 
    ...   chromedriverExecutable=${CHROME_DRIVER}   nativeWebScreenshot=True    browserName=Chrome
    #...   platformVersion=${ANDROID_PLATFORM_VERSION}
    #...   app=${ANDROID_WEB}
    Remove files  ${PATH_SCREENSHOTS}/*.png
    Remove files  ${PATH_VIDEOS}/*.gif
    ScreenCapLibrary.Set Screenshot Directory    ${PATH_VIDEOS}
    Start Gif Recording     embed_width=1200px      size_percentage=1

Valida se a tela principal está visível
    Wait Until Page Contains Element        ${ELEMENTO}

Valida atributo do elemento
    [Arguments]     ${elemento}     ${atributo}     ${valor}
    Element Attribute Should Match      ${elemento}     ${atributo}     ${valor}
    
Deslizar tela para direita 
    #arrasta 90% no canto direito até 10% do lado esquerdo
    Swipe By Percent    90     50      10        50     duration=500

Deslizar tela para esquerda
    #arrasta 10% no canto esquerdo até 90% do lado direito
    Swipe By Percent    10     50      90        50     duration=500

Deslizar tela para baixo
    Wait Until Page Contains Element       ${ELEMENTO}
    ${element_size}=    Get Element Size     ${ELEMENTO}
    ${element_location}=    Get Element Location     ${ELEMENTO}
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.9)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500

Deslizar tela para cima
    Wait Until Page Contains Element       ${ELEMENTO}
    ${element_size}=    Get Element Size     ${ELEMENTO}
    ${element_location}=    Get Element Location     ${ELEMENTO}
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.9)
    Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500

Deslizar tela na vertical pela porcentagem
    [Arguments]     ${a_partir_do_final_da_pagina}      ${ate_topo_da_pagina}
    Wait Until Page Contains Element       ${ELEMENTO}
    ${element_size}=    Get Element Size     ${ELEMENTO}
    ${element_location}=    Get Element Location     ${ELEMENTO}
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * ${a_partir_do_final_da_pagina})
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * ${ate_topo_da_pagina})
    Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500

Deslizar para o lado direito o elemento
    [Arguments]     ${elemento}
    Wait Until Page Contains Element       xpath=//*[@text='${elemento}']
    ${element_size}=    Get Element Size     xpath=//*[@text='${elemento}']/..
    ${element_location}=    Get Element Location     xpath=//*[@text='${elemento}']/..
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.9)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
    Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500

Deslizar para o lado esquerdo o elemento
    [Arguments]     ${elemento}
    Wait Until Page Contains Element       xpath=//*[@text='${elemento}']
    ${element_size}=    Get Element Size     xpath=//*[@text='${elemento}']/..
    ${element_location}=    Get Element Location     xpath=//*[@text='${elemento}']/..
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.9)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
    Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500

Deslizar para o lado o elemento
    [Arguments]     ${inicio}      ${fim}       ${elemento}
    Wait Until Page Contains Element       xpath=//*[@text='${elemento}']
    ${element_size}=    Get Element Size     xpath=//*[@text='${elemento}']/..
    ${element_location}=    Get Element Location     xpath=//*[@text='${elemento}']/..
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * ${inicio})
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * ${fim})
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
    Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500

Valida se o texto está visível
    [Arguments]     ${texto}
    Wait Until Page Contains        ${texto}        20s
    Page Should Contain Text        ${texto}

Valida se o texto não está visível
    [Arguments]     ${texto}
    Wait Until Page Does Not Contain        ${texto}        20s
    Page Should Not Contain Text        ${texto}

Tocar na tela pelas coordenadas
    [Arguments]     ${x}        ${y}
    Sleep   2s
    Tap     locator=${None}     x_offset=${x}     y_offset=${y}     count=1
    Sleep   2s