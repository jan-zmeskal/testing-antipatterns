*** Settings ***
Library     ApiLibrary


*** Test Cases ***
Register endpoint should send email
    [Documentation]    Newly registered user should receive email with further instructions
    [Setup]    Configure SMTP Sender    from="no-reply@phonexia.com"
    Post payload to endpoint    api/auth/register    {"email":"ivan@yandex.ru", "password":"test"}
    ${inbox_content}=    Fetch all emails from inbox    ivan@yandex.ru    мояшуба
    ${registration_mail}=    Get the first email    ${inbox_content}
    Check registration mail content    ${registration_mail}
    [Teardown]    Delete all emails in inbox    ivan@yandex.ru    мояшуба
