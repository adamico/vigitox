class Revue < ActiveRecord::Base
  #validations
  validates_presence_of :numero
  validates_uniqueness_of :numero

  #associations
  has_many :articles, -> {order(:position)}, dependent: :destroy
  has_many :redacteurs, through: :redactionships, source: :author
  has_many :redactionships, dependent: :destroy
  has_one :editorial

  has_attached_file :pdf, storage: :dropbox, dropbox_credentials: Rails.root.join("config/dropbox.yml")

  accepts_nested_attributes_for :editorial,
    reject_if: proc { |attrs| attrs.all? { |k,v| v.blank? } }

  # kaminari
  paginates_per 3

  # attr
  attr_reader :redactionship_tokens

  # class methods
  def self.prev(revue)
    where(numero: revue.numero - 1).first
  end

  def self.next(revue)
    where(numero: revue.numero + 1).first
  end

  def self.recent
    order('numero DESC').limit(3)
  end

  def self.derniere
    recent.first
  end

  # instance methods
  def redactionship_tokens=(ids)
    self.redacteur_ids = ids.split(",")
  end

  def annee_sortie
    date_sortie.beginning_of_year
  end
end
