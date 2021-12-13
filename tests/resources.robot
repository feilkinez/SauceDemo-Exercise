*** Settings ***
Documentation   A resource file with reusable keywords and variables for all test cases in the exercise.
...
...             Creating system specific keywords from default keywords
...             from SeleniumLibrary
Library         SeleniumLibrary

*** Variables ***
${SERVER}           www.saucedemo.com
${BROWSER}          chrome
${VALID USER}       standard_user
${LOCKED OUT USER}  locked_out_user
${PROBLEM USER}     problem_user
${VALID PASS}       secret_sauce
${INVALID PASS}     secretsauce
${LOGIN URL}        https://${SERVER}/


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