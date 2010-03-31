require File.dirname(__FILE__) + '/../spec_helper'

describe Pathologie do
  it "should be valid" do
    Pathologie.new.should be_valid
  end
end
