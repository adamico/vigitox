class Author < ActiveRecord::Base
  validates_presence_of :nom, :prenom
  has_many :articles, :through => :authorships
  has_many :authorships, :dependent => :destroy

  def self.human_name
    "Autheurs"
  end

  def name
    output = "#{nom} "
    initiales = prenom.split.map {|p| p.first + "."}
    output += initiales.join
  end
end

# == Schema Information
#
# Table name: authors
#
#  id                :integer         not null, primary key
#  nom               :string(255)
#  prenom            :string(255)
#  current           :boolean
#  created_at        :datetime
#  updated_at        :datetime
#  authorships_count :integer         default(0)
#

