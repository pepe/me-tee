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
    Then I should see 'This is a webpage containing Your stored design. Save the url for further visit.'
    And I should see big 'angry' icon for 'face'
