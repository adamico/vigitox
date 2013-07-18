class Categorie < ActiveRecord::Base
  has_and_belongs_to_many :articles, -> { includes(:revue).order("revue_id DESC") }, join_table: "articles_categories"

  validates_presence_of :name

  paginates_per 20
end
