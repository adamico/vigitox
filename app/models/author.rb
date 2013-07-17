class Author < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nom_and_prenom, use: :slugged

  alias_attribute :name, :nom_and_prenom

  attr_accessible :nom, :prenom
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
    prenoms = prenom.split("-").many? ? prenom.split("-") : prenom.split
    initiales = prenoms.map {|p| p.first + "."}.join("-")
    [initiales, nom].compact.join(" ")
  end

  def nom_and_prenom
    [nom, prenom].join(" ")
  end
end
