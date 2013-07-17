class Editorial < ActiveRecord::Base
  attr_accessible :titre, :contenu, :author_id
  belongs_to :revue
  belongs_to :author

  delegate :name, to: :author, prefix: true, allow_nil: true
end
