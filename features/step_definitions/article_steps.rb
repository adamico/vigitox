Given(/^an article in a revue$/) do
  @revue = Factory(:revue)
  @article = Factory(:article, :revue_id => @revue.id, :contenu => "contenu")
end

When(/^I visit the revue's page$/) do
  visit revue_path(@revue)
end
