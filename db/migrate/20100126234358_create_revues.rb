class CreateRevues < ActiveRecord::Migration
  def self.up
    create_table :revues do |t|
      t.integer :numero
      t.date :date_sortie
      t.timestamps
    end
  end
  
  def self.down
    drop_table :revues
  end
end
