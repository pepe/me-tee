Feature: Order confirmation
  In order to confirm order
  As a customer
  I need confirmation link

  Background:
    Given there are icons in system

  Scenario: Confirming order
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
    When I follow 'CONFIRM ORDER'
    Then I should see 'Thank you for your order!'
    And I should see 'Order permalink'
    
