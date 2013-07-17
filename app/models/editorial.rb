class Editorial < ActiveRecord::Base
  belongs_to :revue
  belongs_to :author

  def author_name
    author.nom if author
  end
  def author_name=(name)
    self.author = Author.find_by_nom(name)
  end
end
