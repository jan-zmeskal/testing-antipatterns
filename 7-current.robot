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
    Check that user exists in list    ${NEW_USERNAME}
