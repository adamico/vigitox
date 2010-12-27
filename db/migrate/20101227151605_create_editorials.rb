class CreateEditorials < ActiveRecord::Migration
  def self.up
    create_table :editorials do |t|
      t.text :titre
      t.text :contenu
      t.references :author
      t.references :revue

      t.timestamps
    end
  end

  def self.down
    drop_table :editorials
  end
end
