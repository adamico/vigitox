class Revue < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  has_many :articles, :dependent => :destroy, :order => "position"
  has_attached_file :pdf

  validates_presence_of :numero
  validates_uniqueness_of :numero
  validates_attachment_content_type :pdf, :content_type => [ 'application/pdf' ]

  scope :prev, lambda { |r|
    where(["numero < ?", r.numero]).order('numero DESC')
  }
  scope :next, lambda { |r|
    where(["numero > ?", r.numero]).order(:numero)
  }

  def self.derniere
    find(:last).order(:numero)
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

