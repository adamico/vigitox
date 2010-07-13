class Author < ActiveRecord::Base
  validates_presence_of :nom, :prenom
  has_many :articles, :through => :authorships
  has_many :authorships, :dependent => :destroy

  def short_name
    "#{nom} #{prenom.first}."
  end
end
