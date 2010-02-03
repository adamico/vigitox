class RenameColumnInArticlescategories < ActiveRecord::Migration
  def self.up
    change_table :articles_categories do |t|
      t.rename :category_id, :categorie_id
    end
  end

  def self.down
    change_table :articles_categories do |t|
      t.rename :categorie_id, :category_id
    end
  end
end
