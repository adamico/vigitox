class Revue < ActiveRecord::Base
  has_many :articles, :dependent => :destroy
  has_attached_file :pdf
  attr_accessible :numero, :date_sortie, :pdf
  validates_presence_of :numero
  validates_uniqueness_of :numero
  validates_attachment_content_type :pdf, :content_type => [ 'application/pdf' ]
end
