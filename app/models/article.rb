require 'stringex'
class Article < ActiveRecord::Base
  # plugins
  acts_as_list :scope => :revue
  acts_as_indexed :fields => [:ascii_titre, :ascii_contenu]

  # relations
  belongs_to :revue, :counter_cache => true
  has_and_belongs_to_many :categories, :join_table => "articles_categories"
  has_many :authors, :through => :authorships
  has_many :authorships, :dependent => :destroy
  has_one :argumentaire, :dependent => :destroy

  attr_reader :authorship_tokens

  delegate :main_argument, :aux_argument, :to => :argumentaire
  delegate :numero, :to => :revue, :allow_nil => true, :prefix => true

  accepts_nested_attributes_for :argumentaire,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  validates_presence_of :titre

  # kaminari
  paginates_per 20

  def to_param
    position if position
  end

  # class methods
  def self.from_same_revue(a)
    joins(:revue).where('revues.id' => a.revue_id)
  end
  def self.prev(a)
    from_same_revue(a).where("position < ?", a.position).order('position DESC')
  end
  def self.next(a)
    from_same_revue(a).where("position > ?", a.position).order(:position)
  end

  def self.with_main_argument(argument)
    joins(:argumentaire).includes(:revue).where(:argumentaires => {:main_argument_id => argument.id})
  end

  def self.with_aux_argument(argument)
    joins(:argumentaire).includes(:revue).where(:argumentaires => {:aux_argument_id => argument.id})
  end

  def self.articles_revue_numbers_as_main(argument)
    returning liste = [] do
      with_main_argument(argument).each do |article|
        liste << article.revue.numero if article.aux_argument.nil?
      end
      liste.join(', ')
    end
  end

  def articles_aux_arguments_names_and_revue_numbers_as_main(argument)
    liste = []
    temp = {}
    with_main_argument(argument).each do |article|
      if article.aux_argument
        liste << [article.aux_argument.name, [article.revue.numero]]
      end
    end
    liste.each do |item|
      if temp[item[0]].nil?
        temp[item[0]] = item[1]
      else
        temp[item[0]] = [temp[item[0]], item[1]].flatten.sort
      end
    end
    temp.to_a
  end

  # instance methods
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

