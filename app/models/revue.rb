# == Schema Information
# Schema version: 20101024124902
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

class Revue < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  has_many :articles, :dependent => :destroy, :order => "position"

  validates_presence_of :numero
  validates_uniqueness_of :numero

  named_scope :prev, lambda { |r| {:conditions => ["numero < ?", r.numero], :order => 'numero DESC' } }
  named_scope :next, lambda { |r| {:conditions => ["numero > ?", r.numero], :order => :numero } }

  def self.derniere
    find(:last, :order => :numero)
  end

end


