# encoding: utf-8

class Revue < ActiveRecord::Base
  attr_accessible :numero, :date_sortie
  validates_presence_of :numero
  validates_uniqueness_of :numero
end
