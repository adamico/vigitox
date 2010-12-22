class Revue < ActiveRecord::Base

  has_many :articles, :dependent => :destroy, :order => "position"

  validates_presence_of :numero
  validates_uniqueness_of :numero

  named_scope :prev, lambda { |r| {:conditions => ["numero < ?", r.numero], :order => 'numero DESC' } }
  named_scope :next, lambda { |r| {:conditions => ["numero > ?", r.numero], :order => :numero } }

  named_scope :recent, :order => "numero DESC", :limit => 5

  def self.derniere
    find(:last, :order => :numero)
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

