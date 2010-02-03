class AddContenuToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :contenu, :text
  end

  def self.down
    remove_column :articles, :contenu
  end
end
