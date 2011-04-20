# encoding: utf-8
Feature: admin adds new revues and articles
  In order to find articles in all vigitox numbers
  As a vigitox reader
  I want the admin to create new revues and corresponding articles

  Background:
    Given I am a new, authenticated user

  Scenario: successfully create a revue
    When I go to the new revue page
    And I fill in "Numéro" with "1"
    And I select "janvier 2010" as the revue "date_sortie" date
    And I submit
    Then a revue should exist

  Scenario: creating valid new article
    Given a revue exists
    And I am on the revue page
    When I follow "Rajouter un article"
    And I fill in "Titre" with "titre"
    And I submit
    Then an article should exist
