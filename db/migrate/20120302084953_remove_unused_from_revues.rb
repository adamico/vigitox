class RemoveUnusedFromRevues < ActiveRecord::Migration
  def change
    change_table :revues do |t|
      t.remove :pdf_file_name
      t.remove :pdf_file_size
      t.remove :pdf_content_type
      t.remove :pdf_updated_at
      t.remove :issn
    end
  end
end
