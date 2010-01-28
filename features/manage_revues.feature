Feature: admin adds new revues and articles
  In order to find articles in all vigitox numbers
  As a vigitox reader
  I want the admin to create new revues and their articles

  Scenario: successfully create a revue
    Given I am on the homepage
    When I follow "Nouveau numéro"
      And I fill in "Numéro" with "1"
      And I select "janvier 2010" as the revue "date_sortie" date
      And I press "Sauvegarder"
    Then a revue should exist
      And I should see "Vigitox N° 1"
      And I should see "Date de sortie : janvier 2010"

  Scenario: creating revues with existing number

  Scenario: creating revues without number
  
  Scenario: creating revues without issue date
