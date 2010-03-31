require 'test_helper'

class RevueTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Revue.new.valid?
  end
end

# == Schema Information
#
# Table name: revues
#
#  id               :integer         not null, primary key
#  numero           :integer
#  date_sortie      :date
#  created_at       :datetime
#  updated_at       :datetime
#  pdf_file_name    :string(255)
#  pdf_content_type :string(255)
#  pdf_file_size    :integer
#  pdf_updated_at   :datetime
#

