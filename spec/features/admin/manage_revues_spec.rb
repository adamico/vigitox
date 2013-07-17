#encoding: utf-8
require "spec_helper"

feature "Admin manages revues" do
  given(:admin)    { create(:admin) }
  given!(:argument) { create(:argument, name: "argument")}
  background      { login admin }

  scenario "revue creation" do
    visit new_revue_path
    click_on "Enregistrer"
    page.should have_content /erreurs/i
    fill_in "Numéro", with: "1"
    select "janvier", :from => "revue_date_sortie_2i"
    select "2010", :from => "revue_date_sortie_1i"
    click_on "Enregistrer"
    page.should have_content /succès/i
  end

  scenario "article create" do
    visit revue_path(create(:revue))
    click_link "Rajouter un article"
    click_on "Enregistrer et continuer"
    page.should have_content /erreurs/i
    fill_in "article_titre", with: "titre"
    click_on "Enregistrer et continuer"
    page.should have_content /vous devez saisir au moins un argument principal/i
    fill_in "article_argumentaire_attributes_main_argument_name", with: "argument"
    click_on "Enregistrer et continuer"
    page.should have_content /création effectuée avec succès/i
  end

  scenario "article update" do
    create(:revue)
    article = create(:article)
    visit edit_article_path(article)
    fill_in "article_titre", with: "titremisajour"
    click_button "Enregistrer et continuer"
    page.should have_content /modification effectuée avec succès/i
    click_button "Enregistrer et créer un nouvel article"
    page.should have_content /modification effectuée avec succès/i
  end
end
