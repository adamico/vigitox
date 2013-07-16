require 'spec_helper'

describe Article do
  let(:article)   { create(:article) }

  describe "#arguments" do
    it "should return an array of main/aux args couple" do
      main_arg = create(:argument, name: "mainarg")
      aux_arg = create(:argument, name: "auxarg")
      create(:argumentaire, article: article, main_argument: main_arg, aux_argument: aux_arg)
      article.save!
      article.arguments.should == "mainarg, auxarg"
    end

    it "should return an the assigned EMPTY_ARGUMENTS_MESSAGE constant when main/aux args are empty" do
      article.arguments.should == Article::EMPTY_ARGUMENTS_MESSAGE
    end
  end
end
