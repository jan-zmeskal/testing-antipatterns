*** Settings ***
Library     EshopLibrary


*** Test Cases ***
SHP-1918 Feature: Admin/new product
    [Setup]    Go to new product page
    # ${id}=    Create product    Rubber duck with hat    10    10    1
    # ${pui}=    Generate PUI    ${id}
    ${pui}=    Create new product    Rubber duck with hat    10    10    1
    Check Luhn    ${pui}


*** Keywords ***
Check Luhn
    [Arguments]    ${n}
    ${r}=    Evaluate
    ...    (sum([int(ch) for ch in str(${n})][::-1][0::2]) + sum(sum(divmod(d*2,10)) for d in [int(ch) for ch in str(${n})][::-1][1::2])) % 10 == 0
    Should Be True    ${r}
