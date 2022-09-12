*** Settings ***
Library     ApiLibrary


*** Test Cases ***
Data pulled from API should have correct format
    [Documentation]    Pull data dump from API and check its format
    ...    Data dump instability will be fixed in API-1234
    [Setup]    Start API
    ${data}=    Wait Until Keyword Succeeds    20x    0.2s    Get response from endpoint    /api/data/dump
    Check correct format    ${data}


*** Keywords ***
Start API
    Wait Until Keyword Succeeds    5s    0.2s    Start API and check it is up    mode=Testing
