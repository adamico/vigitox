#encoding: utf-8
require "spec_helper"

feature "Browsing revues" do
  given!(:revue) { create(:revue, numero: 3) }

  scenario "accessing last revue" do
    visit root_path
    page.should have_content /Dernier numéro/
    visit revue_path(revue)
    page.should have_content /vigitox numéro 3/
  end

  scenario "going to next and prev revue" do
    create(:revue, numero: 2)
    create(:revue, numero: 4)
    visit revue_path(revue)
    click_link "Numéro précédent"
    page.should have_content /vigitox numéro 2/
    page.should_not have_link "Numéro précédent"
    click_link "Numéro suivant"
    page.should have_content /vigitox numéro 3/
    click_link "Numéro suivant"
    page.should have_content /vigitox numéro 4/
    page.should_not have_link "Numéro suivant"
  end
end
