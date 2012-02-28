require 'stringex'
class Article < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20
  acts_as_list :scope => :revue

  acts_as_indexed :fields => [:ascii_titre, :ascii_contenu]

  attr_reader :authorship_tokens

  belongs_to :revue, :counter_cache => true
  has_and_belongs_to_many :categories, :join_table => "articles_categories"
  has_many :authors, :through => :authorships
  has_many :authorships, :dependent => :destroy

  has_one :argumentaire, :dependent => :destroy
  delegate :main_argument, :aux_argument, :to => :argumentaire
  delegate :numero, :to => :revue, :allow_nil => true, :prefix => true

  accepts_nested_attributes_for :argumentaire,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :authorships,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }, :allow_destroy => true

  validates_presence_of :titre

  scope :prev, lambda { |a|
    where(["position < ?", a.position]).order('position DESC')
  }
  scope :next, lambda { |a|
    where(["position > ?", a.position]).order(:position)
  }

  def authorship_tokens=(ids)
    self.authorship_ids = ids.split(",")
  end

  def arguments
    if argumentaire
      res = [main_argument]
      if aux_argument
        res << aux_argument if aux_argument
      end
      res.map(&:name).join(', ') unless res.empty?
    else
      "aucun argument"
    end
  end

  def authors_list
    #TODO: use new Array.to_s 1.9 syntax
    unless authors.empty?
      authors.map{ |a| a.name }.join(', ').insert(0, '(').insert(-1, ')')
    end
  end

  def full_title
    title = fiche_technique? ? "Fiche technique : " : ""
    title += titre
  end

  def self.search(query, page = 1)
    with_query(query)
  end

  private

  def ascii_titre
    self.titre.to_ascii
  end

  def ascii_contenu
    self.contenu.to_ascii
  end
end




# == Schema Information
# Schema version: 20101022172528
#
# Table name: articles
#
#  id                :integer         primary key
#  titre             :text
#  revue_id          :integer
#  created_at        :timestamp
#  updated_at        :timestamp
#  contenu           :text
#  fiche_technique   :boolean
#  position          :integer
#  authorships_count :integer         default(0)
#

