class AddIssnToRevues < ActiveRecord::Migration
  def self.up
    add_column :revues, :issn, :string
  end

  def self.down
    remove_column :revues, :issn
  end
end
