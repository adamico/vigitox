class Categorie < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :articles, :join_table => "articles_categories"
end
