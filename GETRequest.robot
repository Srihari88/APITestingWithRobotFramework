*** Settings ***
Documentation    Suite description
Library          RequestsLibrary
Library          Collections

*** Test Cases ***
ListofUserInformation
    create session      UserList       ${baseUrl}
    ${response}=    get request         UserList       /api/users?page=2
#    log to console      ${response.status_code}
#    log to console      ${response.content}
#    log to console      ${response.headers}

    ${statuscode}=      convert to string   ${response.status_code}
    should be equal     ${statuscode}       200

    ${body}=           convert to string    ${response.content}
    should contain      ${body}         michael.lawson@reqres.in
    should contain      ${body}         lindsay.ferguson@reqres.in
    should contain      ${body}         tobias.funke@reqres.in
    should contain      ${body}         byron.fields@reqres.in
    should contain      ${body}         george.edwards@reqres.in
    should contain      ${body}         email
    should contain      ${body}         first_name
    should contain      ${body}         last_name
    should contain      ${body}         7
    should contain      ${body}         avatar
    should contain      ${body}         page
    should contain      ${body}         per_page
    should contain      ${body}         total
    should contain      ${body}         total_pages
    should contain      ${body}         data

    ${sta}=      get from dictionary     ${response.headers}     server
    log to console          ${sta}
    should be equal         ${sta}           cloudflare

    ${cache}=      get from dictionary     ${response.headers}     cache-control
    log to console          ${cache}
    should be equal         ${cache}           public, max-age=14400

    ${cache-status}=      get from dictionary     ${response.headers}     cf-cache-status
    log to console          ${cache-status}
    should be equal         ${cache-status}         HIT

    ${ray}=      get from dictionary     ${response.headers}     cf-ray
    log to console          ${ray}
    should be equal         ${ray}          51f007dd0a3fdd02-SIN

    ${endoing}=      get from dictionary     ${response.headers}     content-encoding
    log to console          ${endoing}
    should be equal         ${endoing}          gzip

    ${date}=      get from dictionary     ${response.headers}     date
    log to console          ${date}
    should be equal         ${date}         Tue, 01 Oct 2019 17:07:03 GMT

    ${va}=      get from dictionary     ${response.headers}     vary
    log to console           ${va}
    should be equal          ${va}           Accept-Encoding

    ${vi}=      get from dictionary     ${response.headers}     via
    log to console           ${vi}
    should be equal          ${vi}           1.1 vegur

    ${x-pow}=      get from dictionary     ${response.headers}     x-powered-by
    log to console           ${x-pow}
    should be equal          ${x-pow}            Express

    log many  
    log to console
    log to console      Srihari Tesing
    log to console      Must Read
*** Keywords ***


*** Variables ***

${baseUrl}      https://reqres.in
${subUrl}       /api/users?page=2
