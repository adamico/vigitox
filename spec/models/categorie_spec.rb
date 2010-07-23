require 'spec_helper'

describe Categorie do
  it "should be valid" do
    Categorie.new.should be_valid
  end
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

