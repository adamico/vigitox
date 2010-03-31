class CreateArgumentaires < ActiveRecord::Migration
  def self.up
    create_table :argumentaires do |t|
      t.integer :main_argument_id
      t.integer :aux_argument_id
      t.references :article

      t.timestamps
    end
  end

  def self.down
    drop_table :argumentaires
  end
end
