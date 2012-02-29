class Revue < ActiveRecord::Base
  validates_presence_of :numero
  validates_uniqueness_of :numero

  has_many :articles, :dependent => :destroy, :order => "position"
  has_many :redacteurs, :through => :redactionships, :source => :author
  has_many :redactionships, :dependent => :destroy
  has_one :editorial

  accepts_nested_attributes_for :redactionships,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }, :allow_destroy => true

  accepts_nested_attributes_for :editorial,
    :reject_if => proc { |attrs| attrs.all? { |k,v| v.blank? } }

  self.per_page = 3

  attr_reader :redactionship_tokens

  def self.prev(revue)
    where("numero < ?", revue.numero).order('numero DESC')
  end

  def self.next(revue)
    where("numero > ?", revue.numero).order(:numero)
  end

  def self.recent
    order('numero DESC').limit(3)
  end

  def self.derniere
    recent.first
  end

  def redactionship_tokens=(ids)
    self.redactionship_ids = ids.split(",")
  end

  def annee_sortie
    date_sortie.beginning_of_year
  end
end



# == Schema Information
# Schema version: 20101022172528
#
# Table name: revues
#
#  id               :integer         primary key
#  numero           :integer
#  date_sortie      :date
#  created_at       :timestamp
#  updated_at       :timestamp
#  pdf_file_name    :string(255)
#  pdf_content_type :string(255)
#  pdf_file_size    :integer
#  pdf_updated_at   :timestamp
#  issn             :string(255)
#  articles_count   :integer         default(0)
#  pdf_url          :string(255)
#

