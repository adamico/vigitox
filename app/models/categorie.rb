class Categorie < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :articles, join_table: "articles_categories",
    include: :revue, order: "revue_id DESC"

  validates_presence_of :name

  paginates_per 20
end
