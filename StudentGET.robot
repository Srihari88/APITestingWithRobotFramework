*** Settings ***
Documentation    Suite description
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections

*** Variables ***
${URL}              http://thetestingworldapi.com/


*** Test Cases ***
Get Student details

    create session          Student         ${URL}
    ${Response}=     get request             Student         /api/studentsDetails
    log to console            ${Response.status_code}
    ${body}=        convert to string   ${Response.content}
    ${myjson}=      convert to string        ${Response.json()}

    log to console              ${myjson['id']}      convert to string          1020






