*** Settings ***
Documentation   A test suite for all test cases in the exercise.
...
...             This test follows the example using keywords from
...             the SeleniumLibrary.
Resource        resources.robot

*** Test Cases ***
1 -- Successful user log in
  Open Correct Website
  Input Valid User
  Page Should Contain  Products
  [Teardown]  Close Browser

2 -- Unsuccessful user log in by a locked out user
  Open Correct Website
  Input Locked Out User
  Page Should Contain   Epic sadface: Sorry, this user has been locked out.
  [Teardown]  Close Browser

3 -- Typed wrong password
  Open Correct Website
  Input Wrong Password
  Page Should Contain   Epic sadface: Username and password do not match any user in this service
  [Teardown]  Close Browser

4 -- Logged in as problem user and sees a broken inventory Page
  Open Correct Website
  Input Problem User
  Page Should Contain   Products
  Click Element  item_4_title_link
  Page Should Not Contain  Sauce Labs Backpack
  [Teardown]  Close Browser

5 -- Sort product name (A to Z)
  Open Correct Website
  Input Valid User
  Select From List By Value  class:product_sort_container  az
  Compare AZList to Website List
  [Teardown]  Close Browser

6 -- Sort product name (Z to A)
  Open Correct Website
  Input Valid User
  Select From List By Value  class:product_sort_container  za
  Compare ZAList to Website List
  [Teardown]  Close Browser

7 -- Sort product price (low to high)
  Open Correct Website
  Input Valid User
  Select From List By Value  class:product_sort_container  lohi
  Compare lo-hi to Website List
  [Teardown]  Close Browser

8 -- Sort product price (high to low)
  Open Correct Website
  Input Valid User
  Select From List By Value  class:product_sort_container  hilo
  Compare hi-lo to Website List
  [Teardown]  Close Browser