Feature: Be able to log into the application

  Scenario: Redirect unauthenticated use to the login page
    Given I am not logged in
    When I visit the home page
    Then I should be sent to the login page

  Scenario: Log in successfully
    Given a user exists with the email 'a@a.aa' and the password '123456'
    And I visit the login page
    And I enter in the email 'a@a.aa' and the password '123456'
    When I click 'Log in'
    Then I should be sent to the home page

  Scenario: Log in will not work with wrong password
    Given a user exists with the email 'a@a.aa' and the password '123456'
    And I visit the login page
    And I enter in the email 'a@a.aa' and the password '123457'
    When I click 'Log in'
    Then I should be sent to the login page
