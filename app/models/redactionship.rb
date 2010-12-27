class Redactionship < ActiveRecord::Base
  belongs_to :revue#, :counter_cache => true
  belongs_to :author#, :counter_cache => true

  def redacteur_name
    author.nom if author
  end
  def redacteur_name=(name)
    self.author = Author.find_by_nom(name)
  end
end

# == Schema Information
# Schema version: 20101227151605
#
# Table name: redactionships
#
#  id        :integer         not null, primary key
#  revue_id  :integer
#  author_id :integer
#

