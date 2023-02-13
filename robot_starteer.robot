*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Example Test
    Open Browser    https://www.google.com    Chrome


*** Keywords ***
Open Browser To URL
    [Arguments]    ${url}    ${browser}
    webdrivermanager install ${browser}
    Open Browser    ${url}    ${browser}
