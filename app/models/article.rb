class Article < ActiveRecord::Base
  belongs_to :revue
  has_and_belongs_to_many :categories, :join_table => "articles_categories"
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  validates_presence_of :titre, :contenu

  attr_writer :tag_names
  after_save :assign_tags

  def tag_names
    @tag_names || tags.map(&:name).join(', ')
  end

  private
  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(', ').map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end

end
