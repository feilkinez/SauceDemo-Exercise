*** Settings ***
Documentation   A test suite with a simple test for valid login.
...
...             This test follows the example using keywords from
...             the SeleniumLibrary.
Library         SeleniumLibrary

*** Test Cases ***
Valid Login
  # open browser
  Open Browser  https://www.saucedemo.com/  edge
  # set window size
  Maximize Browser Window
  # check if in login page
  Element Should 
  # input username
  # input password
  # click login button
  # should be open in products page
  # close browser