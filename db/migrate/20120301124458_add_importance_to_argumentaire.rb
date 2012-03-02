class AddImportanceToArgumentaire < ActiveRecord::Migration
  def change
    add_column :argumentaires, :importance, :string
  end
end
