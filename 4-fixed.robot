*** Settings ***
Library     ApiLibrary

*** Variables ***
${TEMPORARY_EMAIL_FILE}=    output/tmp/emails.txt


*** Test Cases ***
Register endpoint should send email
    [Documentation]    Newly registered user should receive email with further instructions
    [Setup]    Configure SMTP Sender    from="no-reply@phonexia.com"    redirect-to=${TEMPORARY_EMAIL_FILE}
    Post payload to endpoint    api/auth/register    {"email":"ivan@yandex.ru", "password":"test"}
    ${inbox_content}=    Load emails from file     ${TEMPORARY_EMAIL_FILE}
    ${registration_mail}=    Get the first email    ${inbox_content}
    Check registration mail content    ${registration_mail}
    [Teardown]    Delete file    ${TEMPORARY_EMAIL_FILE}