*** Settings ***
Documentation       Call different healthcheck endpoints and check that they return correct status

Library             ApiLibrary
Library             String


*** Test Cases ***
DB healthcheck should return ready
    ${response}=    Get response from endpoint    /api/db/healthcheck
    ${status}=    Parse status from response    ${response}
    Should Be String    ${status}
    Should Be Equal As Strings    ${status}    ready

Message queue healthcheck should return ready
    ${response}=    Get response from endpoint    /api/mq/healthcheck
    ${status}=    Parse status from response    ${response}
    Should Be String    ${status}
    Should Be Equal As Strings    ${status}    ready

AI engine healthcheck should return OK
    ${response}=    Get response from endpoint    /api/engine/healthcheck
    ${status}=    Parse status from response    ${response}
    Should Be String    ${status}
    Should Be Equal As Strings    ${status}    OK
