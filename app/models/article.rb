class Article < ActiveRecord::Base
  attr_accessible :titre
  belongs_to :revue
end
