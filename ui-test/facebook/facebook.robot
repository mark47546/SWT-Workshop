*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Test login and post on Facebook
    Go to facebook.com
    Login
    Post สวัสดี robot framework

*** Keywords ***
Go to facebook.com
    ${options} =    Evaluate   sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method    ${options}    add_argument    --disable-notifications
    Open Browser    https://www.facebook.com    gc    options=${options}

Login
    Input Text    id: email    natthaphon4_@hotmail.com
    Input Text    id: pass    natthaphon47546
	Press Keys    id: u_0_b    RETURN

Post สวัสดี robot framework
	Wait Until Page Contains    What's on your mind, Natthaphon?
    Click Element    css: div.oajrlxb2.b3i9ofy5.qu0x051f.esr5mh6w.e9989ue4.r7d6kgcz
    Press Keys    None    สวัสดี robot framework
    Click Element    css: div.oajrlxb2.sli5eluu.qu0x051f.esr5mh6w.e9989ue4


