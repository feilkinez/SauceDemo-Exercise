*** Settings ***
Documentation   A resource file with reusable keywords and variables for all test cases in the exercise.
...
...             Creating system specific keywords from default keywords
...             from SeleniumLibrary
Library         SeleniumLibrary
# Library Source: https://robotframework.org/robotframework/latest/libraries/Collections.html#library-documentation-top
Library         Collections

*** Variables ***
${SERVER}           www.saucedemo.com
${BROWSER}          chrome
${VALID USER}       standard_user
${LOCKED OUT USER}  locked_out_user
${PROBLEM USER}     problem_user
${VALID PASS}       secret_sauce
${INVALID PASS}     secretsauce
${LOGIN URL}        https://${SERVER}/

@{AZ LIST}
  ...  Sauce Labs Backpack
  ...  Sauce Labs Bike Light
  ...  Sauce Labs Bolt T-Shirt
  ...  Sauce Labs Fleece Jacket
  ...  Sauce Labs Onesie
  ...  Test.allTheThings() T-Shirt (Red)

@{ZA LIST}
  ...  Test.allTheThings() T-Shirt (Red)
  ...  Sauce Labs Onesie
  ...  Sauce Labs Fleece Jacket
  ...  Sauce Labs Bolt T-Shirt
  ...  Sauce Labs Bike Light
  ...  Sauce Labs Backpack

@{LOHI LIST}
  ...  $7.99
  ...  $9.99
  ...  $15.99
  ...  $15.99
  ...  $29.99
  ...  $49.99

@{HILO LIST}
  ...  $49.99
  ...  $29.99
  ...  $15.99
  ...  $15.99
  ...  $9.99
  ...  $7.99

*** Keywords ***
Open Correct Website
  Open Browser  ${LOGIN URL}  ${BROWSER}
  Page Should Contain Element  login-button

Input Valid User
  Input Text  user-name   ${VALID USER}
  Input Password  password  ${VALID PASS}
  Click Button  login-button

Input Locked Out User
  Input Text  user-name   ${LOCKED OUT USER}
  Input Password  password  ${VALID PASS}
  Click Button  login-button

Input Wrong Password
  Input Text  user-name   ${VALID USER}
  Input Password  password  ${INVALID PASS}
  Click Button  login-button

Input Problem User
  Input Text  user-name   ${PROBLEM USER}
  Input Password  password  ${VALID PASS}
  Click Button  login-button

# ---------------------------
# FOR LOOP SOURCE: https://robocorp.com/docs/languages-and-frameworks/robot-framework/for-loops
# ---------------------------

Compare AZList to Website List
  ${i}=  Set Variable  0
  ${weblist}=  Get WebElements  class:inventory_item_name
  FOR  ${element}  IN  @{weblist}
    ${cur}=  Get From List   ${AZ LIST}   ${i}
    Should Be Equal   ${element.text}   ${cur}
    ${i}=   Evaluate   ${i}+1
  END

Compare ZAList to Website List
  ${i}=  Set Variable  0
  ${weblist}=  Get WebElements  class:inventory_item_name
  FOR  ${element}  IN  @{weblist}
    ${cur}=  Get From List   ${ZA LIST}   ${i}
    Should Be Equal   ${element.text}   ${cur}
    ${i}=   Evaluate   ${i}+1
  END

Compare lo-hi to Website List
  ${i}=  Set Variable  0
  ${weblist}=  Get WebElements  class:inventory_item_price
  FOR  ${element}  IN  @{weblist}
    ${cur}=  Get From List   ${LOHI LIST}   ${i}
    Should Be Equal   ${element.text}   ${cur}
    ${i}=   Evaluate   ${i}+1
  END

Compare hi-lo to Website List
  ${i}=  Set Variable  0
  ${weblist}=  Get WebElements  class:inventory_item_price
  FOR  ${element}  IN  @{weblist}
    ${cur}=  Get From List   ${HILO LIST}   ${i}
    Should Be Equal   ${element.text}   ${cur}
    ${i}=   Evaluate   ${i}+1
  END