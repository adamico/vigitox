class CreateAttributionPathologies < ActiveRecord::Migration
  def self.up
    create_table :attribution_pathologies do |t|
      t.integer :article_id
      t.integer :pathologie_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attribution_pathologies
  end
end
