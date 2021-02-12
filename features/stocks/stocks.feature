Feature: Authenticated users can view stock values

  Scenario: Someone who is not logged in cannot visit the page.
    Given I am not logged in
    When I visit the stocks page
    Then I should be sent to the login page

  Scenario: Someone who is logged in should be able to visit the stocks page
    Given I am logged in
    When I visit the stocks page
    Then I should be sent to the stocks page