*** Settings ***
Library         EshopLibrary

Suite Setup     Log in as admin


*** Variables ***
${ORIGINAL_USERNAME}    shopper
${ORIGINAL_PASSWORD}    secretpassword
${ORIGINAL_GENDER}      male
${ORIGINAL_AGE}         30

${NEW_USERNAME}         shopper2
${NEW_GENDER}           nonbinary
${NEW_AGE}              16


*** Test Cases ***
Admin can change user properties
    [Setup]    Run Keywords    Create user via DB    ${ORIGINAL_USERNAME}    ${ORIGINAL_PASSWORD}    ${ORIGINAL_GENDER}    ${ORIGINAL_AGE}
    ...    AND    Go to user list
    Open user edit dialog    ${ORIGINAL_USERNAME}
    Change user properties    username=${NEW_USERNAME}    gender=${NEW_GENDER}    age=${NEW_AGE}
    Go to user list
    Open user view dialog    ${NEW_USERNAME}
    ${current_age}=    Get user property    age
    ${current_gender}=    Get user property    gender
    Should Be Equal As Integers    ${current_age}    ${NEW_AGE}
    Should Be Equal As Strings    ${current_gender}    ${NEW_GENDER}
