Feature: Changing locale
  In order to use other language than english
  As a customer
  I want flags with locale changing functionality

  Scenario: Change to czech locale
    Given I visit '/'
    When I follow 'czech'
    Then I should see 'me-tee triko o tobě'
    When I follow 'english'
    Then I should see 'me-tee t-shirt about you'


