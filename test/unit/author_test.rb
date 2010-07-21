require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: authors
#
#  id                :integer         not null, primary key
#  nom               :string(255)
#  prenom            :string(255)
#  current           :boolean
#  created_at        :datetime
#  updated_at        :datetime
#  authorships_count :integer         default(0)
#

