*** Settings ***
Documentation    Suite description
Library     RequestsLibrary
Library     Collections

*** Test Cases ***

MyPostRequest
    create session          mypost      ${BaseUrl}
    ${body}=     create dictionary       email=sri@gmail.com        password=Leaderjki
    ${header}=   create dictionary       content-type=application/json
    ${response}=    post request         mypost       /api/register       data=${body}     headers=${header}
    log to console        ${response.status_code}



*** Keywords ***



*** Variables ***

${BaseUrl}       https://reqres.in


