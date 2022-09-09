*** Settings ***
Documentation       Call different healthcheck endpoints and check that they return correct status

Library             ApiLibrary
Library             String

Test Template       Healthcheck endpoint should return correct status


*** Test Cases ***    ENDPOINT    EXPECTED STATUS
Database    /api/db/healthcheck    ready
Message queue    /api/mq/healthcheck    ready
AI engine    /api/engine/healthcheck    OK


*** Keywords ***
Healthcheck endpoint should return correct status
    [Arguments]    ${endpoint}    ${expected_status}
    ${response}=    Get response from endpoint    ${endpoint}
    ${status}=    Parse status from response    ${response}
    Should Be String    ${status}
    Should Be Equal As Strings    ${status}    ${expected_status}
