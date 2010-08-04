Feature: Retrieving of design
  In order to come back and continue
  As a customer
  I want to retrieve saved design

  Background:
    Given there are icons in system
    And I saved design before

  Scenario: Retrieving t-shirt design
    Given I visit saved design page
    Then I should see 'Your design has been restored'
    And I should see big 'angry' icon for 'face'
