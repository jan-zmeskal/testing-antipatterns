*** Settings ***
Library             EshopLibrary

Test Teardown       Delete user via DB    ${TEST_USERNAME}


*** Variables ***
${TEST_USERNAME}    shopper
${TEST_PASSWORD}    secretpassword


*** Test Cases ***
Create user via registration form
    [Setup]    Go to user registration page
    Fill in user credentials    ${TEST_USERNAME}    ${TEST_PASSWORD}
    ${fake_card_number} =    Generate card number
    Fill in card number    ${fake_card_number}
    Submit registration
    Wait until registration succeeds    timeout=10s

Delete user via delete account form
    [Setup]    Run Keywords    Go to delete account page
    ...    AND    Create user via DB    ${TEST_USERNAME}    ${TEST_PASSWORD}
    Fill in user credentials    ${TEST_USERNAME}    ${TEST_PASSWORD}
    Submit account deletion    confirm=True
    Wait until account deletion succeeds    timeout=10s
