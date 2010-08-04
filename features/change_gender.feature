Feature: Genre changing
  In order to change t-shirt gender for male or female
  As a customer
  I need link to do it and see result

  Scenario: Changing to male t-shirt
    Given I visit '/'
    When I follow 'male'
    Then I should see 'me-tee t-shirt about you'
    Then I should see 'You chose male tee'

  Scenario: Changing to female t-shirt
    Given I visit '/'
    When I follow 'female'
    Then I should see 'me-tee t-shirt about you'
    Then I should see 'You chose female tee'

