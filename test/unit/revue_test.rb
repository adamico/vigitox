require 'test_helper'

class RevueTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Revue.new.valid?
  end
end
