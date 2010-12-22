class AddPdfUrlToRevues < ActiveRecord::Migration
  def self.up
    add_column :revues, :pdf_url, :string
  end

  def self.down
    remove_column :revues, :pdf_url
  end
end
