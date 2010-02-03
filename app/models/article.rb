class Article < ActiveRecord::Base
  attr_accessible :titre
  belongs_to :revue
  has_and_belongs_to_many :categories
end
