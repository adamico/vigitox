class Pathologie < ActiveRecord::Base
  has_many :attribution_pathologies, :dependent => :destroy
  has_many :articles, :through => :attribution_pathologies
end
