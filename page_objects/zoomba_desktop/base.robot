*** Settings ***
Library     Zoomba.DesktopLibrary
Library     ScreenCapLibrary   quality=100
Library     OperatingSystem
Documentation       Base da automação desktop usando Zoomba

*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723
${APP_CALC}                     Microsoft.WindowsCalculator_8wekyb3d8bbwe!App
${APP_NOTEPAD}                  C:/Windows/System32/notepad.exe
${WIN_APP_DRIVER}               C:/Arquivos de Programas/Windows Application Driver/WinAppDriver.exe

${PATH_DESKTOP_SCREENSHOTS}         ./results/desktop
${PATH_DESKTOP_VIDEOS_CALC}         ./results/desktop/videos/calculadora
${PATH_DESKTOP_VIDEOS_NOTEPAD}      ./results/desktop/videos/notepad

*** Keywords ***
Setup Test ScreenCapLibrary Calculadora
    ScreenCapLibrary.Set Screenshot Directory       ${PATH_DESKTOP_VIDEOS_CALC}
    Start Gif Recording     name=${TEST NAME}       embed_width=1200px      size_percentage=1

Setup Test ScreenCapLibrary Notepad
    ScreenCapLibrary.Set Screenshot Directory       ${PATH_DESKTOP_VIDEOS_NOTEPAD}
    Start Gif Recording     name=${TEST NAME}       embed_width=1200px      size_percentage=1
    
Start Calculadora
    Remove files  ${PATH_DESKTOP_SCREENSHOTS}/*.png
    Remove files  ${PATH_DESKTOP_VIDEOS_CALC}/*.gif
    Driver Setup        ${WIN_APP_DRIVER}
    Open Application    ${REMOTE_URL}     platformName=Windows    deviceName=Windows   app=${APP_CALC}    alias=CALC
    #Maximize Window
    Quit Application

Start Notepad
    Remove files  ${PATH_DESKTOP_SCREENSHOTS}/*.png
    Remove files  ${PATH_DESKTOP_VIDEOS_NOTEPAD}/*.gif
    Driver Setup        ${WIN_APP_DRIVER}   
    Open Application    ${REMOTE_URL}     platformName=Windows    deviceName=Windows   app=${APP_NOTEPAD}    alias=NOTEPAD
    #Maximize Window
    Quit Application