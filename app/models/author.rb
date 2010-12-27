class Author < ActiveRecord::Base
  validates_presence_of :nom, :prenom

  has_many :articles, :through => :authorships
  has_many :authorships, :dependent => :destroy
  has_many :revues, :through => :redactionships
  has_many :redactionships, :dependent => :destroy

  def self.human_name
    "Autheurs"
  end

  def short_name
    output = "#{nom} "
    initiales = prenom.split.map {|p| p.first + "."}
    output += initiales.join
  end
end


# == Schema Information
# Schema version: 20101022172528
#
# Table name: authors
#
#  id                :integer         primary key
#  nom               :string(255)
#  prenom            :string(255)
#  current           :boolean
#  created_at        :timestamp
#  updated_at        :timestamp
#  authorships_count :integer         default(0)
#

