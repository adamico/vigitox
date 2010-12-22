class Argument < ActiveRecord::Base
  # validations
  validates_presence_of :name

  # constants
  NATURES = %w(pathologie produit circonstance)

  # custom methods
  def articles_as_main
    Article.joins(:argumentaire).where(:argumentaires => {:main_argument_id => self.id})
  end

  def articles_as_aux
    Article.joins(:argumentaire).where(:argumentaires => {:aux_argument_id => self.id})
  end

  def articles_revue_numbers_as_main
    returning liste = [] do
      self.articles_as_main.each do |a|
        liste << a.revue.numero if a.aux_argument.nil?
      end
      liste.join(', ')
    end
  end

  def articles_aux_arguments_names_and_revue_numbers_as_main
    liste = []
    temp = {}
    self.articles_as_main.each do |a|
      if a.aux_argument
        liste << [a.aux_argument.name, [ a.revue.numero ]]
      end
    end
    liste.each do |item|
      if temp[item[0]].nil?
        temp[item[0]] = item[1]
      else
        temp[item[0]] = [temp[item[0]], item[1]].flatten.sort
      end
    end
    temp.to_a
  end
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

