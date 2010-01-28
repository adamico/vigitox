Feature: admin adds new revues and articles
  In order to find articles in all vigitox numbers
  As a vigitox reader
  I want the admin to create new revues and their articles

  Scenario: successfully create a revue
    Given I am on the homepage
    When I follow "Nouveau numéro"
      And I fill in "Numéro" with "1"
      And I select "Janvier 2010" as the "Date de sortie" date
      And I press "Sauvegarder"
    Then a revue should exist

  Scenario: creating revues with existing number

  Scenario: creating revues without number
  
  Scenario: creating revues without issue date
