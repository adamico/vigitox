class Article < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20
  acts_as_list :scope => :revue
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

  named_scope :prev, lambda { |a| {:conditions => ["position < ?", a.position], :order => 'position DESC' } }
  named_scope :next, lambda { |a| {:conditions => ["position > ?", a.position], :order => :position } }

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
    unless authors.empty?
      authors.map{ |a| a.short_name }.join(', ').insert(0, '(').insert(-1, ')')
    end
  end

  def full_title
    title = fiche_technique? ? "Fiche technique : " : ""
    title += titre
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

