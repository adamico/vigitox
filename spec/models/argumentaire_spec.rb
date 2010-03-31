require 'spec_helper'

describe Argumentaire do
  before(:each) do
    @valid_attributes = {
      :main_argument_id => 1,
      :aux_argument_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Argumentaire.create!(@valid_attributes)
  end
end


# == Schema Information
#
# Table name: argumentaires
#
#  id               :integer         not null, primary key
#  main_argument_id :integer
#  aux_argument_id  :integer
#  article_id       :integer
#  created_at       :datetime
#  updated_at       :datetime
#

