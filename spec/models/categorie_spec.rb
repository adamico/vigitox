require File.dirname(__FILE__) + '/../spec_helper'

describe Categorie do
  it "should be valid" do
    Categorie.new.should be_valid
  end
end
