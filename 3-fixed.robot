*** Settings ***
Documentation       Check that all license endpoints return correct info

Library             ApiLibrary
Library             String

Test Template       License endpoint should return correct info


*** Variables ***
${LICENSE_INFO_TEMPLATE}    This component is licensed using {license_type} license


*** Test Cases ***    ENDPOINT    EXPECTED LICENSE TYPE
Database    /api/db/license    MIT
Message queue    /api/mq/license    GPL
AI engine    /api/engine/license    MIT


*** Keywords ***
License endpoint should return correct info
    [Arguments]    ${endpoint}    ${expected_license_type}
    ${expected_info}=    Format String    ${LICENSE_INFO_TEMPLATE}    license_type=${expected_license_type}
    ${response}=    Get Response From Endpoint    ${endpoint}
    Should Be Equal As Strings    ${response}    ${expected_info}
