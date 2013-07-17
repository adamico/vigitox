#encoding: utf-8
require "spec_helper"

feature "Browsing revues" do
  given!(:revue)    { create(:revue, numero: 3) }
  given!(:article)  { create(:article, revue: revue) }

  scenario "accessing last revue" do
    visit root_path
    page.should have_content /Dernier numéro/i
    visit revue_path(revue)
    page.should have_content /vigitox n° 3/i
  end

  scenario "going to next and prev revue" do
    create(:revue, numero: 2)
    create(:revue, numero: 4)
    visit revue_path(revue)
    click_link "Numéro précédent"
    page.should have_content /vigitox n° 2/i
    page.should_not have_link "Numéro précédent"
    click_link "Numéro suivant"
    page.should have_content /vigitox n° 3/i
    click_link "Numéro suivant"
    page.should have_content /vigitox n° 4/i
    page.should_not have_link "Numéro suivant"
  end

  scenario "read article" do
    visit article_path(article)
  end

  describe "search" do
    given!(:revue)           {create(:revue)}
    given!(:argumentaire)    {create(:argumentaire, main_argument: create(:argument, name: "argument"))}

    (1..3).each do |i|
      given!(:"article#{i}") {create(:article, titre: "titre de l'article#{i}",
                                     contenu: "contenu de l'article#{i}",
                                     revue: revue, argumentaire: argumentaire)}
    end

    %w(titre contenu argument).each do |field|
      scenario "by keyword in #{field} field" do
        visit root_path
        fill_in "search", with: "#{field}"
        click_on "search_button"
        (1..3).each do |i|
          page.should have_content("titre de l'article#{i}")
        end
      end
    end
  end
end
