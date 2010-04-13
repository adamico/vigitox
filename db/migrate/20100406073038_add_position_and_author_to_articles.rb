class AddPositionAndAuthorToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.integer :position
      t.references :author
    end
  end

  def self.down
    t.remove :position
    t.remove_references :author
  end
end
