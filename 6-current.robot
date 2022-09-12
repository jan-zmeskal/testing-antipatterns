*** Settings ***
Library     EshopLibrary


*** Variables ***
${TEST_ITEM}    Rubber Duck Yellow


*** Test Cases ***
Add one item to shopping cart
    Add to cart    item=${TEST_ITEM}    quantity=1
    ${items_in_cart}=    Get number of items in cart
    Should Be Equal As Integers    ${items_in_cart}    1

Add multiple items to shopping cart
    Add to cart    item=${TEST_ITEM}    quantity=10
    ${items_in_cart}=    Get number of items in cart
    Should Be Equal As Integers    ${items_in_cart}    11
