#encoding: utf-8
require "spec_helper"

feature "Admin manages thesaurus" do
  given(:admin)   { create(:admin) }
  background      { login admin }

  %w(argument author categorie).each do |resource|
    klass = resource.classify.constantize
    scenario "#{resource} creation" do
      visit new_polymorphic_path(klass)
      click_on "Enregistrer"
      page.should have_content /erreurs/i
      if resource == "author"
        fill_in "Nom", with: "Dupond"
        fill_in "Prénom", with: "Martin"
      else
        fill_in "#{resource}_name", with: "thename"
      end
      click_on "Enregistrer"
      page.should have_content /création effectuée avec succès/i
    end

    scenario "#{resource} update" do
      visit edit_polymorphic_path(klass.find(create(resource).id))
      if resource == "author"
        fill_in "Nom", with: "Dupond"
        fill_in "Prénom", with: "Martin"
      else
        fill_in "#{resource}_name", with: "thename"
      end
      click_on "Enregistrer"
      page.should have_content /modification effectuée avec succès/i
    end

    scenario "#{resource} destroy" do
      visit polymorphic_path(klass.find(create(resource).id))
      click_link "Détruire"
      page.should have_content /destruction effectuée avec succès/i
    end
  end
end
