class CreateRedactionships < ActiveRecord::Migration
  def self.up
    create_table :redactionships do |t|
      t.references :revue
      t.references :author
    end
  end

  def self.down
    drop_table :redactionships
  end
end
