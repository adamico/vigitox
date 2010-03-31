class Argument < ActiveRecord::Base
  attr_accessible :name, :nature
  validates_presence_of :name
  #NATURES = %w(pathologie médicament champignon)
  def articles_as_main
    Article.all :joins => :argumentaire, :conditions => { 'argumentaires.main_argument_id' => self.id}
  end
  def articles_as_aux
    Article.all :joins => :argumentaire, :conditions => { 'argumentaires.aux_argument_id' => self.id}
  end
end

# == Schema Information
#
# Table name: arguments
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  nature     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

