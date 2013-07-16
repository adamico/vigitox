class Argument < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name, :nature

  friendly_id :name, use: :slugged

  # validations
  validates_presence_of :name

  # constants
  NATURES = %w(pathologie produit circonstance)

  default_scope order("LOWER(name) ASC")

  #kaminari
  paginates_per 18
end
