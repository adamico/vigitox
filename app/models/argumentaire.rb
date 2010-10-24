# == Schema Information
# Schema version: 20101024124902
#
# Table name: argumentaires
#
#  id               :integer         primary key
#  main_argument_id :integer
#  aux_argument_id  :integer
#  article_id       :integer
#  created_at       :timestamp
#  updated_at       :timestamp
#

class Argumentaire < ActiveRecord::Base
  belongs_to :article
  belongs_to :main_argument, :class_name => "Argument"
  belongs_to :aux_argument, :class_name => "Argument"

  def main_argument_name
    main_argument.name if main_argument
  end
  def aux_argument_name
    aux_argument.name if aux_argument
  end
  def main_argument_name=(name)
    self.main_argument = Argument.find_by_name(name)
  end
  def aux_argument_name=(name)
    self.aux_argument = Argument.find_by_name(name)
  end
end
