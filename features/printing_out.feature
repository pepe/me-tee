Feature: Print out of order
  In order to see all informations even after some time
  As a customer
  I need printout page with them

  Background:
    Given there are icons in system

  Scenario: Printing out
    Given I ordered tee as usual
    When I follow 'Order permalink'
    Then I should see 'Joe Doe'
    And I should see 'Pool 1'
    And I should see 'Prague'
    And I should see '11150'
    And I should see 'joe@doe.cz'
    And I should see '420777888999'
    And I should see 'will come again'
    And I should see 'METEE2010'
    And I should see 'faces' icon 'angry'
    And I should see 'hobbies' icon 'swim'
    And I should see 'jobs' icon 'cook'

