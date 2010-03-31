class Argumentaire < ActiveRecord::Base
  belongs_to :article
  belongs_to :main_argument, :class_name => "Argument"
  belongs_to :aux_argument, :class_name => "Argument"
end


# == Schema Information
#
# Table name: argumentaires
#
#  id               :integer         not null, primary key
#  main_argument_id :integer
#  aux_argument_id  :integer
#  article_id       :integer
#  created_at       :datetime
#  updated_at       :datetime
#

