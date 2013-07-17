class Categorisation < ActiveRecord::Base
  attr_accessible :article_id, :categorie_id
  belongs_to :article
  belongs_to :categorie
end
