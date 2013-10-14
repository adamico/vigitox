class Categorie < ActiveRecord::Base
  has_and_belongs_to_many :old_articles, -> { includes(:revue).order("revue_id DESC") }, join_table: "articles_categories", class_name: "Article"
  has_many :articles, -> { includes(:revue).order("revue_id DESC") }, through: :categorisations
  has_many :categorisations, dependent: :destroy

  validates_presence_of :name

  paginates_per 20
end
