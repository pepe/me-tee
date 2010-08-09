Feature: Checkout
  In order to see summary with all filled information
  As a customer
  I need checkout page

  Background:
    Given there are icons in system

  Scenario: Checking out
    Given I designed a tee
    And I press 'order'
    And I fill in 'Joe Doe' for 'fullname'
    And I fill in 'Pool 1' for 'street'
    And I fill in 'Prague' for 'city'
    And I fill in '11150' for 'zip'
    And I fill in 'joe@doe.cz' for 'email'
    And I fill in '420777888999' for 'phone'
    And I fill in 'will come again' for 'note'
    And I fill in 'METEE2010' for 'coupon'
    When I press 'order'
    Then I should see 'Order summary'
    And I should see 'Joe Doe'
    And I should see 'Pool 1'
    And I should see 'Prague'
    And I should see '11150'
    And I should see 'joe@doe.cz'
    And I should see '420777888999'
    And I should see 'will come again'
    And I should see 'METEE2010'
    And I should see 'face' icon 'angry'
    And I should see 'hobby' icon 'swim'
    And I should see 'job' icon 'cook'

  Scenario: Checking out
    Given I designed a tee
    And I press 'order'
    And I fill in 'Joe Doe' for 'fullname'
    And I fill in 'Pool 1' for 'street'
    And I fill in 'Prague' for 'city'
    And I fill in '11150' for 'zip'
    And I fill in 'joe@doe.cz' for 'email'
    And I fill in '420777888999' for 'phone'
    And I fill in 'will come again' for 'note'
    And I fill in 'METEE2010' for 'coupon'
    And I press 'order'
    When I follow 'back'
    Then I should see 'Contact form'

