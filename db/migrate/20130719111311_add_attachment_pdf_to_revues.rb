class AddAttachmentPdfToRevues < ActiveRecord::Migration
  def self.up
    change_table :revues do |t|
      t.attachment :pdf
    end
  end

  def self.down
    drop_attached_file :revues, :pdf
  end
end
