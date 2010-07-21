class Authorship < ActiveRecord::Base
  belongs_to :article, :counter_cache => true
  belongs_to :author, :counter_cache => true

  def author_name
    author.nom if author
  end

  def author_name=(name)
    self.author = Author.find_by_nom(name)
  end
end

# == Schema Information
#
# Table name: authorships
#
#  id         :integer         not null, primary key
#  article_id :integer
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

