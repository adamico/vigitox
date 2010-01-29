# encoding: utf-8
Feature: admin adds new revues and articles
  In order to find articles in all vigitox numbers
  As a vigitox reader
  I want the admin to create new revues and corresponding articles

  Scenario: successfully create a revue
    Given I am on the homepage
    When I create a valid revue
    Then a revue should exist

  Scenario: creating revues with existing numbers
    Given a revue exists with numero: "1"
    When I go to the homepage
      And I follow "Nouveau numéro"
      And I fill in "Numéro" with "1"
      And I select "janvier 2010" as the revue "date_sortie" date
      And I submit
    Then I should see "Numero n'est pas disponible"
      And 1 revues should exist

  Scenario: creating revues without number
    Given I am on the homepage
    When I follow "Nouveau numéro"
      And I select "janvier 2010" as the revue "date_sortie" date
      And I submit
    Then I should see "Numero doit etre rempli(e)"
