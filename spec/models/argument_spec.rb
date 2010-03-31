require File.dirname(__FILE__) + '/../spec_helper'

describe Argument do
  before(:each) do
    Article.destroy_all
    Argument.destroy_all
    @argument = Argument.new
  end
  it "should be valid with name" do
    @argument.name = "valueforname"
    @argument.should be_valid
  end
  describe "#articles_as" do
    before(:each) do
      @argument.save
      @article1 = Article.create(:titre => "letitre")
      @article1.build_argumentaire
    end
    context "_main" do
      it "should list articles where it figures as the main argument" do
        @article1.argumentaire.main_argument = @argument
        @article1.argumentaire.save
        @argument.articles_as_main.should == [ @article1 ]
      end
    end
    context "_aux" do
      it "should list articles where it figures as the aux argument" do
        @article1.argumentaire.aux_argument = @argument
        @article1.argumentaire.save
        @argument.articles_as_aux.should == [ @article1 ]
      end
    end
  end
end

# == Schema Information
#
# Table name: arguments
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  nature     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

