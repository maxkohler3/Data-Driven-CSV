*** Settings ***

Documentation           Data driven starter suite 
Library                 QWeb
Library                 DataDriver    reader_class=TestDataApi    name=CopadoAppTestData.csv
Suite Setup             Open Browser    about:blank   chrome
Suite Teardown          Close All Browsers
Test Setup              Home
Test Template           Shop for products

*** Test Case ***
Shop for product ${product}

*** Keywords ***

Shop for products
    [Documentation]     Data driven starter suite with csv file
    [Arguments]         ${product}    ${detail}         
    ClickText           ${product}
    VerifyText          ${detail}
    ClickText           Add to cart
    VerifyText          Cart summary
    VerifyText          ${product}
    ClickText           Continue shopping

Home
    [Documentation]     Set the application state to the shop home page.
    GoTo                https://qentinelqi.github.io/shop/

