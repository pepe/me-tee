Feature: Home page
  In order to have start somewhere and configure t-shirt
  As a customer
  I need home page

  Scenario: Visiting home page
    Given I visit '/'
    Then I should see 'me-tee t-shirt about you'

  Scenario: Checking t-shirt configuration
    Given I visit '/'
    Then I should see 'male'
    Then I should see 'female'
    Then I should see 'save'
    Then I should see 'random'

  Scenario: Choosing size
    Given I visit '/'
    Then I could select 'S' from 'size'
    Then I could select 'M' from 'size'
    Then I could select 'L' from 'size'
    Then I could select 'XL' from 'size'
    Then I could select 'XXL' from 'size'

  Scenario: Changing gender
    Given I visit '/'
    Then I could follow 'male'
    Given I visit '/'
    Then I could follow 'female'

  Scenario: Saving design
    Given I visit '/'
    Then I could follow 'save'

  Scenario: Randomizing design
    Given I visit '/'
    Then I could follow 'random'

  Scenario: Order
    Given I visit '/'
    Then I could press 'order'
