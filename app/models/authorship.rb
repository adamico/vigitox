class Authorship < ActiveRecord::Base
  belongs_to :article, :counter_cache => true
  belongs_to :author, :counter_cache => true
end
