# encoding: utf-8
When(/^(?:|I )select "([^\"]*)" as the revue "([^\"]*)" date$/) do |date, date_label|
  month,year = date.split(' ')
  select year, :from => "revue_#{date_label}_1i"
  select month, :from => "revue_#{date_label}_2i"
end

When(/I create a valid revue/) do
  steps %Q{
    When I follow "Nouveau numéro"
    And I fill in "Numéro" with "1"
    And I select "janvier 2010" as the revue "date_sortie" date
    And I submit
  }
end

When(/^I submit$/) do
  steps %Q{
    And I press "Enregistrer"
  }
end
