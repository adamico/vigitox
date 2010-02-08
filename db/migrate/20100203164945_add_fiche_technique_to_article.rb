class AddFicheTechniqueToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :fiche_technique, :boolean
  end

  def self.down
    remove_column :articles, :fiche_technique
  end
end
