Feature: Filling contact form
  In order to fill contact information
  As a customer
  I want contact form

  Background:
    Given there are icons in system

  Scenario: Filing contact form
    Given I designed a tee
    When I press 'order'
    Then I should see 'Contact form'
    And I could fill in 'Joe Doe' for 'name'
    And I could fill in 'Pool 1' for 'street'
    And I could fill in 'Prague' for 'city'
    And I could fill in '11150' for 'zip'
    And I could fill in 'joe@doe.cz' for 'email'
    And I could fill in '420777888999' for 'phone'
    And I could fill in 'will come again' for 'note'
    And I could fill in 'METEE2010' for 'coupon'
    
  Scenario: Getting back to design
    Given I designed a tee
    When I press 'order'
    And I follow 'back'
    Then I should see 'How to buy'

