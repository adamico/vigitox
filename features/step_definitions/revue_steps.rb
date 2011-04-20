# encoding: utf-8
When(/^(?:|I )select "([^\"]*)" as the revue "([^\"]*)" date$/) do |date, date_label|
  month,year = date.split(' ')
  select year, :from => "revue_#{date_label}_1i"
  select month, :from => "revue_#{date_label}_2i"
end

When(/^I submit$/) do
  steps %Q{
    And I press "Enregistrer"
  }
end

Given /^I am on an existing revue page$/ do
  revue = Revue.create!(:numero => 1, :date_sortie => Time.now.to_date)
  visit '/revues/1'
end
