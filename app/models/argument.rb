class Argument < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  # validations
  validates_presence_of :name

  # constants
  NATURES = %w(pathologie produit circonstance)

  default_scope order("LOWER(name) ASC")

  #kaminari
  paginates_per 20
end



# == Schema Information
# Schema version: 20101022172528
#
# Table name: arguments
#
#  id         :integer         primary key
#  name       :string(255)
#  nature     :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

