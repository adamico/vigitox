class DropAttributionPathologies < ActiveRecord::Migration
  def change
    drop_table :attribution_pathologies
  end
end
