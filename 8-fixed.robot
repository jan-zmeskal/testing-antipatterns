*** Settings ***
Library     EshopLibrary


*** Test Cases ***
Admin can create new product in catalog
    [Documentation]    Create a new product as admin and check that valid identifier has been generated for it.
    [Setup]    Go to new product page
    ${prodct_unique_identifier}=    Create new product    name=Rubber duck    price=10    quantity=10    public=true
    Check that number is valid Luhn number    ${prodct_unique_identifier}


*** Keywords ***
Check that number is valid Luhn number
    [Documentation]    Take a number and check that it was generated using Luhn algorithm.
    ...    That's because all our product IDs must comply withh ISO/IEC_7812-1.
    [Arguments]    ${number}
    ${is_valid_luhn_number}=    Evaluate
    ...    (sum([int(ch) for ch in str(${number})][::-1][0::2]) + sum(sum(divmod(d*2,10)) for d in [int(ch) for ch in str(${number})][::-1][1::2])) % 10 == 0
    Should Be True    ${is_valid_luhn_number}
