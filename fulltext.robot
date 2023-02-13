*** Settings ***
Library SeleniumLibrary
*** Variables ***
${generalTimeSleep} 1.5

*** Keywords ***
Hp Zlutak To SRL
[Arguments] ${driver} ${kamPojedete} ${destinace} ${pokracovatBtn1} ${pokracovatBtn2} ${termin} ${pokracovatBtn3} ${obsazenost} ${potvrditAvyhledat} ${skipObsazenostSetting}=False
Wait Until Element Is Visible ${kamPojedete}
Click Element ${kamPojedete}

bash
Copy code
Wait Until Element Is Visible  ${destinace}
Click Element  ${destinace}

Wait Until Element Is Visible  ${pokracovatBtn1}
Click Element  ${pokracovatBtn1}
Sleep  ${GeneralTimeSleep}
Wait Until Element Is Visible  ${pokracovatBtn2}
Click Element  ${pokracovatBtn2}

Wait Until Element Is Visible  ${termin}
Click Element  ${termin}
Sleep  ${GeneralTimeSleep}
Wait Until Element Is Visible  ${pokracovatBtn3}
Click Element  ${pokracovatBtn3}

${isSettingSkipped}=  Set Variable  ${skipObsazenostSetting}
Run Keyword If  '${isSettingSkipped}' == 'False'
...  Wait Until Element Is Visible  ${obsazenost}
...  Click Element  ${obsazenost}

Sleep  ${GeneralTimeSleep}
Wait Until Element Is Visible  ${potvrditAvyhledat}
Click Element  ${potvrditAvyhledat}
Sleep  4