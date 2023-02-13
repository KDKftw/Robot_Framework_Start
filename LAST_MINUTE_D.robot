*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}    Chrome

*** Keywords ***
[Arguments] ${url} ${browser}
Open Browser ${url} ${browser}
Close Browser
Close All Browsers


Element not found
    Raise Exception    Element not found


Wait Until Page Contains Element
    [Arguments]    ${locator}    ${timeout}=20s
    FOR    ${counter}    IN RANGE    ${timeout}
        Run Keyword If    '${counter}' == '${timeout}'    Exit For Loop    Element not found
        ${element}=    Get Web Element    ${locator}
        Run Keyword If    '${element}' != 'None'    Exit For Loop
        Sleep    1
    END
    Element not found


Click Element
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}
    ${element}=    Get Web Element    ${locator}
    Click Element    ${element}

Get WebElements
    [Arguments] ${driver} ${locator}
    Wait Until Page Contains Element    ${locator}    timeout=20s
    ${elements}=    Call Method    ${driver}    find_elements_by_xpath    ${locator}
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

*** Test Cases ***
Test LM is Displayed
    Open Browser    ${URL_lm}    ${BROWSER}
    Maximize Browser Window
    Sleep    10.5
    ${zajezdyLMsingle}=    Get WebElements    ${BROWSER}    //[@class='page-tour']
    ${zajezdyLMall}=    Get WebElements    ${BROWSER}    //[@class='page-tour']
    Run Keyword If    '${zajezdyLMsingle}'!=''    Should Be Visible    ${zajezdyLMsingle}[0]
    FOR    ${element}    IN    @{zajezdyLMall}
        Run Keyword    Should Be Visible    ${element}
    END
    ${rozbal}=    Get WebElements    ${BROWSER}    //[@class='page-tour-cell page-tour-control']
    Run Keyword If    '${rozbal}'!=''    Should Be Visible    ${rozbal}[0]
    Click Element    ${rozbal}[0]
    Sleep    2
    ${rozbalenyZajezd}=    Get WebElements    ${BROWSER}    //[@class='page-tour-hotel-name']
    ${rozbalenyZajezdAll}=    Get WebElements    ${BROWSER}    //*[@class='page-tour-hotel-name']
    Run Keyword If    '${rozbalenyZajezd}'!=''    Should Be Visible    ${rozbalenyZajezd}[0]
