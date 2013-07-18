class Editorial < ActiveRecord::Base
  belongs_to :revue
  belongs_to :author

  delegate :name, to: :author, prefix: true, allow_nil: true
end
