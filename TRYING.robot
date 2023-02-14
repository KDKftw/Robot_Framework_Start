*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    https://www.fischer.cz/last-minute
${locator_of_element_to_verify}     //[@class='page-tour']
${locator_of_element_to_click}      //[@class='page-tour-cell page-tour-control']

*** Test Cases ***
Example Test Case
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${locator_of_element_to_verify}
    Element Should Be Visible    ${locator_of_element_to_verify}
    Click Element    ${locator_of_element_to_click}

    Close Browser