require 'test_helper'

class AuthorshipTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: authorships
#
#  id         :integer         not null, primary key
#  article_id :integer
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

