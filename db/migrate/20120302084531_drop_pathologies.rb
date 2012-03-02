class DropPathologies < ActiveRecord::Migration
  def change
    drop_table :pathologies
  end
end
