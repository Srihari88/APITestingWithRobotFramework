*** Settings ***
Documentation    Suite description
Library         Collections
Library         RequestsLibrary

*** Test Cases ***
Authendication API Testing
    ${Auth}=   create list      anthony.admanstate      mesabone
    ${headers}=     create dictionary       content-type=application/json       Authorization=Basic
    create session          SriHari       ${BaseUrl}       headers=${headers}      auth=${Auth}
    ${response}=   post request     SriHari    /profile/login
    log to console        ${response.status_code}
    log to console        ${response.headers}



*** Keywords ***

*** Variables ***


${BaseUrl}      https://www.pitchvision.com


