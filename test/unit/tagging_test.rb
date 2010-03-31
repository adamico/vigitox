require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: taggings
#
#  id         :integer         not null, primary key
#  article_id :integer
#  tag_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

