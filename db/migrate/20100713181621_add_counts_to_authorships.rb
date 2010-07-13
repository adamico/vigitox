class AddCountsToAuthorships < ActiveRecord::Migration
  def self.up
    add_column :articles, :authorships_count, :integer, :default => 0
    add_column :authors,  :authorships_count, :integer, :default => 0
    Article.reset_column_information
    Article.all.each do |article|
      Article.update_counters article.id, :authorships_count => article.authorships.length
    end
    Author.reset_column_information
    Author.all.each do |author|
      Author.update_counters author.id, :authorships_count => author.authorships.length
    end
  end

  def self.down
    add_column :articles, :authorships_count
    add_column :authors,  :authorships_count
  end
end
