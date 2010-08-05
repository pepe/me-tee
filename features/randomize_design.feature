Feature: Randomizing of design
  In order to get some fresh designs
  As a customer
  I want to have random design 

  Background:
    Given there are icons in system

  Scenario: Randomizing t-shirt design
    Given I visit '/'
    When I follow 'random'
    And I should see big 'angry' icon for 'face'
