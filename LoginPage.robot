***Settings***
Library    SeleniumLibrary

***Variables***
${URL}                  https://www.saucedemo.com/
${Browser}              chrome
${Username_accepted}    standard_user
${Password_accepted}    secret_sauce
${Password_unaccepted}  wrong_password


***Keywords***
Open browser of website 
    [Arguments]     ${URL}      ${Browser} 
    Open browser    ${URL}      ${Browser} 

Check empty input
    Textfield Value Should Be        id:user-name    ${EMPTY}
    Textfield Value Should Be        id:password     ${EMPTY}

login Pass
    [Arguments]      ${Username}      ${password} 
    Input Text       id:user-name     ${Username} 
    Input Text       id:password      ${password}
    Click Element    id:login-button
    ${Current_URL}=  Get Location
    Should Be Equal As Strings  ${Current_URL}   https://www.saucedemo.com/inventory.html

login fail
    [Arguments]      ${Username}      ${password} 
    Input Text       id:user-name     ${Username} 
    Input Text       id:password      ${password}
    Click Element    id:login-button
    ${Current_URL}=  Get Location
    Should Be Equal As Strings  ${Current_URL}   https://www.saucedemo.com/
    ${Text_error}=   Get text   xpath://*[@data-test="error"]
    Should Be Equal As Strings  ${Text_error}    Epic sadface: Username and password do not match any user in this service

***Test Cases***
Check defualt
    Open browser of website         ${URL}      ${Browser}
    Check empty input

login
    login fail                      ${Username_accepted}    ${Password_unaccepted}
    login Pass                      ${Username_accepted}    ${Password_accepted}