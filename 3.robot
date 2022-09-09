*** Settings ***
Documentation       Check that all license endpoints return correct info

Library             ApiLibrary
Library             String

Test Template       License endpoint should return correct info


*** Test Cases ***    ENDPOINT    EXPECTED INFO
Database    /api/db/license    This component is licensed using MIT license
Message queue    /api/mq/license    This component is licensed using GPL license
AI engine    /api/engine/license    This component is licensed using MIT license


*** Keywords ***
License endpoint should return correct info
    [Arguments]    ${endpoint}    ${expected_info}
    ${response}=    Get Response From Endpoint    ${endpoint}
    Should Be Equal As Strings    ${response}    ${expected_info}
