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


# == Schema Information
#
# Table name: revues
#
#  id               :integer         not null, primary key
#  numero           :integer
#  date_sortie      :date
#  created_at       :datetime
#  updated_at       :datetime
#  pdf_file_name    :string(255)
#  pdf_content_type :string(255)
#  pdf_file_size    :integer
#  pdf_updated_at   :datetime
#  issn             :string(255)
#  articles_count   :integer         default(0)
#

