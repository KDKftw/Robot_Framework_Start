*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    https://www.fischer.cz/last-minute
${locator_of_element_to_verify}     //*[contains(@class, 'page-tour')]
${locator_of_element_to_click}      //*[contains(@class, 'page-tour-cell') and contains(@class, 'page-tour-control')]
${rozbaleny_zajezd_to_check_if_displayed}     //*[@class='page-tour-hotel-name']

*** Test Cases ***
Example Test Case
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${locator_of_element_to_verify}
    Element Should Be Visible    ${locator_of_element_to_verify}
    Click Element    ${locator_of_element_to_click}
    Sleep   10s
    Element Should Be Visible   ${rozbaleny_zajezd_to_check_if_displayed}
    Close Browser