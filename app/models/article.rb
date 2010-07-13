class Article < ActiveRecord::Base
  acts_as_list :scope => :revue
  belongs_to :revue
  has_and_belongs_to_many :categories, :join_table => "articles_categories"
  has_many :authors, :through => :authorships
  has_many :authorships, :dependent => :destroy

  has_one :argumentaire, :dependent => :destroy
  delegate :main_argument, :aux_argument, :to => :argumentaire

  accepts_nested_attributes_for :argumentaire,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :authorships,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }, :allow_destroy => true

  validates_presence_of :titre

  def args_couple
    [main_argument, aux_argument]
  end

  def authors_list
    authors.map { |a| a.short_name }.join(', ')
  end
end


# == Schema Information
#
# Table name: articles
#
#  id              :integer         not null, primary key
#  titre           :text
#  revue_id        :integer
#  created_at      :datetime
#  updated_at      :datetime
#  contenu         :text
#  fiche_technique :boolean
#  position        :integer
#  author_id       :integer
#

