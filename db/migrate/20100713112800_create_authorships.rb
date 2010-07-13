class CreateAuthorships < ActiveRecord::Migration
  def self.up
    create_table :authorships do |t|
      t.references :article
      t.references :author

      t.timestamps
    end
  end

  def self.down
    drop_table :authorships
  end
end
