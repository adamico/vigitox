require 'spec_helper'

describe Revue do
  subject {Factory(:revue)}
  # #redacteurs
  it {should respond_to(:redacteurs)}
  describe "#redacteurs" do
    it "should return an array of authors" do
      3.times do
        subject.redacteurs << Factory(:author)
      end
      subject.save!
      subject.redacteurs.should == Author.all
    end
  end
end
