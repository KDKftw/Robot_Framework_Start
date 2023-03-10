*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

*** Keywords ***
Raise Exception
    [Arguments]    ${message}
    Raise Exception    ${message}

Element not found
    Raise Exception    Element not found

Convert To Integer
    [Arguments]    ${string}
    ${integer}=    Convert To Integer    ${string}
    [Return]       ${integer}

Wait Until Page Contains Element
    [Arguments]    ${locator}    ${timeout}=20
    ${timeout}=    Convert To Integer    ${timeout}
    ${timeout_count}=    Set Variable    ${timeout}
    : FOR    ${counter}    IN RANGE    ${timeout}
    \    Run Keyword If    '${counter}' == '${timeout}'    Exit For Loop
    \    ${element}=    Get Web Element    ${locator}
    \    Run Keyword If    '${element}' != 'None'    Exit For Loop
    \    Sleep    1s
    : Fail    Element not found

Get WebElements
    [Arguments]    ${browser}    ${locator}
    Wait Until Page Contains Element    ${locator}    timeout=20s
    ${elements}=    Call Method    ${browser}    find_elements_by_xpath    ${locator}
    [Return]    ${elements}

Should Be Visible
    [Arguments]    ${element}
    ${is_visible}=    Call Method    ${element}    is_displayed
    Run Keyword If    ${is_visible}==False    Fail    Element is not visible

Click Element
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}    timeout=20s
    ${element}=    Get Web Element    ${locator}
    Click Element    ${element}

*** Variables ***
${browser}=    Chrome
${url}=    https://www.fischer.cz/last-minute

*** Test Cases ***
Test LM is Displayed
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    10s
    ${zajezdyLMsingle}=    Get WebElements    ${browser}    //[@class='page-tour']
    ${zajezdyLMall}=    Get WebElements    ${browser}    //[@class='page-tour']
    Run Keyword If    '${zajezdyLMsingle}'!=''    Should Be Visible    ${zajezdyLMsingle}[0]
    : FOR    ${element}    IN    @{zajezdyLMall}
    \    Run Keyword    Should Be Visible    ${element}
    ${rozbal}=    Get WebElements    ${browser}    //[@class='page-tour-cell page-tour-control']
    Run Keyword If    '${rozbal}'!=''    Should Be Visible    ${rozbal}[0]
    Click Element    ${rozbal}[0]
    Sleep    2s
    ${rozbalenyZajezd}=    Get WebElements    ${browser}    //[@class='page-tour-hotel-name']
    ${rozbalenyZajezdAll}=    Get WebElements    ${browser}    //*[@class='page-tour-hotel-name']
    Run Keyword If    '${rozbalenyZajezd}'!=''    Should Be Visible    ${rozbalenyZajezd}[0]
    : FOR    ${element}    IN    @{rozbalenyZajezdAll}
    \    Run Keyword    Should Be Visible    ${element}
    Close Browser
