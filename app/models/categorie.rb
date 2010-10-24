# == Schema Information
# Schema version: 20101024124902
#
# Table name: categories
#
#  id         :integer         primary key
#  name       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

class Categorie < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :articles, :join_table => "articles_categories", :include => :revue, :order => "revue_id DESC"
end

