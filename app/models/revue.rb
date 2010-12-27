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

  scope :prev, lambda {|r| where(["numero < ?", r.numero]).order('numero DESC')}
  scope :next, lambda {|r| where(["numero > ?", r.numero]).order(:numero)}

  scope :recent, order("numero DESC").limit(5)

  def self.derniere
    find(:last)
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

