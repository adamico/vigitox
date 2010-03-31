class CreatePathologies < ActiveRecord::Migration
  def self.up
    create_table :pathologies do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :pathologies
  end
end
