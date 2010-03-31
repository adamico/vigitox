# encoding: utf-8
class Article < ActiveRecord::Base
  belongs_to :revue
  has_and_belongs_to_many :categories, :join_table => "articles_categories"

  has_one :argumentaire, :dependent => :destroy
  delegate :main_argument, :aux_argument, :to => :argumentaire

  accepts_nested_attributes_for :argumentaire,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  validates_presence_of :titre

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
#

