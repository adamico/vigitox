require 'stringex'
class Article < ActiveRecord::Base
  attr_accessible :revue_id, :titre, :contenu, :fiche_technique, :position, :author_ids, :categorie_ids, :argumentaire_attributes

  # plugins
  acts_as_list scope: :revue
  acts_as_indexed fields: [:ascii_titre, :ascii_contenu, :main_argument]

  # relations
  belongs_to :revue, counter_cache: true
  has_many :categories, through: :categorisations
  has_many :categorisations, dependent: :destroy
  has_many :authors, through: :authorships
  has_many :authorships, dependent: :destroy
  has_one :argumentaire, dependent: :destroy

  attr_reader :authorship_tokens

  delegate :main_argument, :aux_argument, to: :argumentaire
  delegate :numero, to: :revue, allow_nil: true, prefix: true

  accepts_nested_attributes_for :argumentaire
  validates_associated :argumentaire, message: "vous devez saisir au moins un argument principal"
  validates_presence_of :titre

  # kaminari
  paginates_per 20

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
    joins(:argumentaire).includes(:revue).where(argumentaires: {main_argument_id: argument.id})
  end

  def self.with_aux_argument(argument)
    joins(:argumentaire).includes(:revue).where(argumentaires: {aux_argument_id: argument.id})
  end

  def self.revue_numbers_with_main_argument(argument)
    liste = []
    with_main_argument(argument).each do |article|
      liste << article.revue.numero if article.aux_argument.nil?
    end
    liste.join(', ')
  end

  def self.aux_arguments_names_and_revue_numbers_with_main_argument(argument)
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
    self.author_ids = ids.split(",")
  end

  def arguments
    [main_argument, aux_argument].compact.map(&:name).join(', ')
  end

  def authors_list
    #TODO: use new Array.to_s 1.9 syntax
    unless authors.empty?
      authors.map{ |a| a.name }.join(', ').insert(0, '(').insert(-1, ')')
    end
  end

  def full_title
    prepend = fiche_technique? ? "Fiche technique" : nil
    [prepend, titre].compact.join(" : ")
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
