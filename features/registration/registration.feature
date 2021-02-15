Feature: Be able to sign up for the application

  Scenario: Sign up
    Given I am not logged in
    And I visit sign up page
    When I fill in the registration fields with an email of 'a@a.aa' and a password of 'password'
    And I click 'Sign up'
    Then I should be sent to the home page
    And a user should exist with en email of 'a@a.aa'

  Scenario: Mismatching passwords should fail login
    Given I am not logged in
    And I visit sign up page
    When I fill in the registration fields with an email of 'a@a.aa', a password of 'password', and a password confirmation of 'p@ssword'
    And I click 'Sign up'
    Then I should be sent to the users page
    And I should see 'Password confirmation doesn't match Password'
