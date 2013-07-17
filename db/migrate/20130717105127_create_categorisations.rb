class CreateCategorisations < ActiveRecord::Migration
  def change
    create_table :categorisations do |t|
      t.belongs_to :article
      t.belongs_to :categorie

      t.timestamps
    end

    add_index :categorisations, :article_id
    add_index :categorisations, :categorie_id

    say "created categorisations table and indexes"

    say_with_time "populate categorisations table using the current join table" do
      Article.all.each do |article| # loop through articles
        article.categories.each do |categorie| #loop through current categories using old join table
          article.categorisations.create(categorie_id: categorie.id) # create new join table records using old join table
        end
      end
    end
  end
end
