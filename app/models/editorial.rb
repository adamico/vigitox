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

# == Schema Information
# Schema version: 20101227151605
#
# Table name: editorials
#
#  id         :integer         not null, primary key
#  titre      :text
#  contenu    :text
#  author_id  :integer
#  revue_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

