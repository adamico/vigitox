class Revue < ActiveRecord::Base
  has_many :articles, :dependent => :destroy
  has_attached_file :pdf
  attr_accessible :numero, :date_sortie, :pdf
  validates_presence_of :numero
  validates_uniqueness_of :numero
  validates_attachment_content_type :pdf, :content_type => [ 'application/pdf' ]
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
#

