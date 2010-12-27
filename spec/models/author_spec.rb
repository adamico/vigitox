require 'spec_helper'

describe Author do
  subject {Factory.build(:author)}
  it {should be_valid}
  # #revues
  it {should respond_to(:revues)}
  describe "#revues" do
    it "should return an array of revues where self is redacteur" do
      3.times do
        subject.revues << Factory(:revue)
      end
      subject.save!
      subject.revues.should == Revue.all
    end
  end
end
