*** Settings ***
Library     ApiLibrary


*** Test Cases ***
Data pulled from API should have correct format
    [Documentation]    This endpoint sometimes crashes because our network volume has issues.
    ...    Just run the test again if it happens.
    [Setup]    Start API
    ${data}=    Get response from endpoint    /api/data/dump
    Check correct format    ${data}


*** Keywords ***
Start API
    Start API in mode    Testing
    Sleep    5s    Wait for API to start
    Check That Api Has Started
