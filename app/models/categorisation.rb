class Categorisation < ActiveRecord::Base
  belongs_to :article
  belongs_to :categorie
end
