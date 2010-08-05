Feature: Static pages
  In order to check all information
  As customer
  I want pages with them

  Scenario: How to buy
    Given I visit '/how-to-buy'
    Then I should see 'Jak vytvořit a koupit tričko'

  Scenario: Bussiness conditions
    Given I visit '/business-conditions'
    Then I should see 'Všeobecné obchodní podmínky'

  Scenario: Privacy
    Given I visit '/privacy'
    Then I should see 'Ochrana Vašich dat a soukromí'

  Scenario: Contact
    Given I visit '/contact'
    Then I should see 'Provozovatel & Kontakt'

  Scenario: 
    Given I visit '/transport-payment'
    Then I should see 'Způsob dopravy & Způsob platby'

