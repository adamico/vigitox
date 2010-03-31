class Categorie < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :articles, :join_table => "articles_categories"
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

