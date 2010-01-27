Feature: manage revues
  In order to create a revue
  As the vigitox index manager
  I want to create and update articles with details

  Scenario: create a revue
    Given I am on the homepage
    When I follow "Nouveau numéro"
      And I fill in "Numéro" with "1"
      And I press "Sauvegarder"
    Then a revue should exist
