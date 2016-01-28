Feature: Login
  Scenario: User is not sign in
    Given I'm an unregistered user
    When I visit "/" page
    Then I will redirect to "/login" page

  Scenario: User is registered
    Given I'm a registered user
    When I visit "/login" page
    When fill my credentials
    And I click "Login" button
    Then I will redirect to "/" page
    Then I see "Welcome! you sign in successfully"

  Scenario: User is registered but use bad password
    Given I'm a registered user
    When I visit "/login" page
    And fill my credentials with bad password
    And I click "Login" button
    Then I will redirect to "/login" page
    Then I see "Invalid email/password combination"

  Scenario: User is signed in
    Given I'm a signed in user
    When I visit "/" page
    And click in "Log out" link
    Then I will redirect to "/logout" page
