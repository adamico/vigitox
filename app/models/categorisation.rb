class Categorisation < ActiveRecord::Base
  belongs_to :article, counter_cache: true
  belongs_to :categorie, counter_cache: true
end
