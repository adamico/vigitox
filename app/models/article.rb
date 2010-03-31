# encoding: utf-8
class Article < ActiveRecord::Base
  belongs_to :revue
  has_and_belongs_to_many :categories, :join_table => "articles_categories"
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  has_many :attribution_pathologies, :dependent => :destroy
  has_many :pathologies, :through => :attribution_pathologies

  validates_presence_of :titre

  attr_writer :produit_names
  after_save :assign_produits

  attr_writer :pathologie_names
  after_save :assign_pathologies

  def pathologie_names
    @pathologie_names || pathologies.map(&:name).join(', ')
  end

  def produit_names
    @produit_names || tags.map(&:name).join(', ')
  end

  private
  def assign_produits
    if @produit_names
      self.tags = @produit_names.split(', ').map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end

  def assign_pathologies
    if @pathologie_names
      self.pathologies = @pathologie_names.split(', ').map do |name|
        Pathologie.find_or_create_by_name(name)
      end
    end
  end

end
