class CreateArguments < ActiveRecord::Migration
  def self.up
    create_table :arguments do |t|
      t.string :name
      t.string :nature
      t.timestamps
    end
  end
  
  def self.down
    drop_table :arguments
  end
end
