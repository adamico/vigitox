class Argument < ActiveRecord::Base
  # validations
  validates_presence_of :name

  # constants
  NATURES = %w(pathologie produit circonstance)

  # custom methods
  def articles_as_main
    Article.all :joins => :argumentaire, :conditions => { 'argumentaires.main_argument_id' => self.id}
  end

  def articles_as_aux
    Article.all :joins => :argumentaire, :conditions => { 'argumentaires.aux_argument_id' => self.id}
  end

  def articles_revue_numbers_as_main
    liste = []
    self.articles_as_main.each do |a|
      liste << a.revue.numero if a.aux_argument.nil?
    end
    liste.join(', ')
  end

  def articles_aux_arguments_names_and_revue_numbers_as_main
    liste = []
    self.articles_as_main.each do |a|
      liste << [a.aux_argument.name, a.revue.numero] if a.aux_argument
    end
    liste
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

