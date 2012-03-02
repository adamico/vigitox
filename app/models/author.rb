class Author < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nom_and_prenom, use: :slugged

  validates_presence_of :nom, :prenom

  has_many :articles, :through => :authorships
  has_many :authorships, :dependent => :destroy
  has_many :revues, :through => :redactionships
  has_many :redactionships, :dependent => :destroy

  default_scope order(:nom).includes(:authorships)
  paginates_per 18
  def self.human_name
    "Auteurs"
  end

  def short_name
    initiales = prenom.split.map {|p| p.first + "."}
    output = initiales.join
    output += " #{nom}"
  end

  def nom_and_prenom
    "#{nom} #{prenom}"
  end
end
