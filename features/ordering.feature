Feature: Ordering of the t-shirt
  In order to have chance to order designed t-shirt
  As a customer
  I want ordering procedure

  Background:
    Given there are icons in system

  Scenario: Bad order
    Given I visit '/'
    When I press 'order'
    Then I should see 'All three icons must be choosed'

  Scenario: Starting order
    Given I visit '/'
    And I follow 'female'
    And I select 'XXL' from 'size'
    And I follow 'face angry'
    And I follow 'hobby swim'
    And I follow 'job cook'
    When I press 'order'
    Then I should see 'Tee how you designed it'
    And I should see 'Contact form'
    And I should see 'face' icon 'angry'
    And I should see 'hobby' icon 'swim'
    And I should see 'job' icon 'cook'
