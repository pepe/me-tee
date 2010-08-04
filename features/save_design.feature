Feature: Saving of design
  In order to have design saved for tomorrows
  As a customer
  I want to save current design

  Background:
    Given there are icons in system

  Scenario: Saving t-shirt design
    Given I visit '/'
    And I follow 'face angry'
    And I follow 'hobby swim'
    And I follow 'job cook'
    When I follow 'save'
    Then I should see 'Tee how you design it'
