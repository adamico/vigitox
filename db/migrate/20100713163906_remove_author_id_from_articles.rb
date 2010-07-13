class RemoveAuthorIdFromArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.remove_references :author
    end
  end

  def self.down
    t.references :author
  end
end
