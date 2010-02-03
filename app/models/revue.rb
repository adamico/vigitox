class Revue < ActiveRecord::Base
  has_many :articles, :dependent => :destroy
  has_attached_file :pdf
  attr_accessible :numero, :date_sortie
  validates_presence_of :numero
  validates_uniqueness_of :numero
end
