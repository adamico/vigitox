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

  scenario "revue update" do
    revue = create(:revue)
    visit edit_revue_path(revue)
    fill_in "Numéro", with: ""
    click_on "Enregistrer"
    page.should have_content /erreurs/i
    fill_in "Numéro", with: revue.numero
    click_on "Enregistrer"
    page.should have_content /succès/i
  end

  scenario "article create", js: true do
    visit revue_path(create(:revue))
    click_link "Rajouter un article"
    fill_in "article_titre", with: "titre"
    click_on "Enregistrer et continuer"
    page.should have_content /vous devez saisir au moins un argument principal/i
    page.execute_script %|$("#article_argumentaire_attributes_main_argument_id").val(#{argument.id})|
    click_on "Enregistrer et continuer"
    page.should have_content /création effectuée avec succès/i
  end

  scenario "article update" do
    create(:revue)
    article = create(:article)
    article.argumentaire.should_not be_nil
    visit edit_article_path(article)
    fill_in "article_titre", with: ""
    click_button "Enregistrer et continuer"
    page.should have_content /erreurs/i
    fill_in "article_titre", with: "titremisajour"
    click_button "Enregistrer et continuer"
    page.should have_content /modification effectuée avec succès/i
    click_button "Enregistrer et créer un nouvel article"
    page.should have_content /modification effectuée avec succès/i
  end
end
