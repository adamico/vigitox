When(/^(?:|I )select "([^\"]*)" as the revue "([^\"]*)" date$/) do |date, date_label|
  month,year = date.split(' ')
  select year, :from => "revue_#{date_label}_1i"
  select month, :from => "revue_#{date_label}_2i"
end
