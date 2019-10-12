*** Settings ***
Documentation    Suite description
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Test Cases ***
Tc_001 Create new resource
    create session      TestingWorld        ${BaseUrl}
    &{body}=        create dictionary       first_name=Srihari1      middle_name=naidu1       last_name=Pudu1      date_of_birth=26/06/1988
    &{header}=      create dictionary       Content-Type=application/json
    ${response}=    post request       TestingWorld        /api/studentsDetails      data=${body}    headers=${header}



    # Get the body results.
    ${body}=        convert to string     ${response.content}

     should contain          ${body}        first_name
     should contain          ${body}        middle_name
     should contain          ${body}        last_name
     should contain          ${body}        date_of_birth
     should contain          ${body}        Srihari1
     should contain          ${body}        naidu1
     should contain          ${body}        Pudu1
     should contain          ${body}        26/06/1988

    #Headers verification

    ${cache}=       get from dictionary         ${response.headers}     cache-control
    log to console          ${cache}

    ${length}=      get from dictionary         ${response.headers}     content-length
    log to console          ${length}

    ${type}=        get from dictionary         ${response.headers}     content-type
    log to console          ${type}

    ${date}=        get from dictionary         ${response.headers}     date
    log to console          ${date}

    ${expires}=     get from dictionary         ${response.headers}     expires
    log to console          ${expires}

    ${pragma}=      get from dictionary         ${response.headers}     pragma
    log to console          ${pragma}

    ${server}=      get from dictionary         ${response.headers}     server
    log to console          ${server}

    ${version}=     get from dictionary         ${response.headers}     x-aspnet-version
    log to console          ${version}

    ${power}=       get from dictionary         ${response.headers}     x-powered-by
    log to console          ${power}

    ${plesk}=       get from dictionary         ${response.headers}     x-powered-by-plesk
    log to console          ${plesk}





*** Keywords ***




*** Variables ***

${BaseUrl}      http://thetestingworldapi.com/



