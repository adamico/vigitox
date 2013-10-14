class AddCountsForCategorisations < ActiveRecord::Migration
  def self.up
    add_column :articles, :categorisations_count, :integer, default: 0
    add_column :categories,  :categorisations_count, :integer, default: 0
    Article.reset_column_information
    Article.all.each do |article|
      Article.update_counters article.id, categorisations_count: article.categorisations.length
    end
    Categorie.reset_column_information
    Categorie.all.each do |categorie|
      Categorie.update_counters categorie.id, categorisations_count: categorie.categorisations.length
    end
  end

  def self.down
    remove_column :articles, :categorisations_count
    remove_column :categories,  :categorisations_count
  end
end
