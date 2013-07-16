require 'spec_helper'

describe Article do
  let(:revue)         { create(:revue, numero: "1") }
  let(:revue2)        { create(:revue, numero: "2") }
  let(:revue3)        { create(:revue, numero: "3") }
  let(:article)       { create(:article, revue: revue) }
  let(:article2)      { create(:article, revue: revue2) }
  let(:article3)      { create(:article, revue: revue3) }
  let(:arg1)          { create(:argument, name: "arg1") }
  let(:arg2)          { create(:argument, name: "arg2") }

  describe ".with_main_argument" do
    it "should list articles with the provided main argument" do
      create(:argumentaire, article: article, main_argument: arg1, aux_argument: arg2)
      Article.with_main_argument(arg1).should == [article]
    end
  end

  describe ".with_aux_argument" do
    it "should list articles with the provided aux argument" do
      create(:argumentaire, article: article, main_argument: arg2, aux_argument: arg1)
      Article.with_aux_argument(arg1).should == [article]
    end
  end

  describe ".revue_numbers_with_main_argument" do
    it "should print revue numbers for articles with only the main argument provided" do
      create(:argumentaire, article: article, main_argument: arg1, aux_argument: nil)
      Article.revue_numbers_with_main_argument(arg1).should == "1"
    end
  end

  describe ".aux_arguments_names_and_revue_numbers_with_main_argument" do
    let!(:aux1) { create(:argument, name: "aux1") }
    let!(:aux2) { create(:argument, name: "aux2") }
    context "when main/aux couple is unique" do
      it "should return an array [[aux1.name, [revue.numero]], [aux2.name, [revue2.numero]]]" do
        create(:argumentaire, article: article, main_argument: arg1, aux_argument: aux1)
        create(:argumentaire, article: article2, main_argument: arg1, aux_argument: aux2)
        Article.aux_arguments_names_and_revue_numbers_with_main_argument(arg1).should ==
          [["aux1", [1]], ["aux2", [2]]]
      end
    end
    context "when multiple main/aux couples are found" do
      it "should return an array [aux argument name, [revue numbers]]" do
        create(:argumentaire, article: article, main_argument: arg1, aux_argument: aux1)
        create(:argumentaire, article: article2, main_argument: arg1, aux_argument: aux1)
        create(:argumentaire, article: article3, main_argument: arg1, aux_argument: aux2)
        Article.aux_arguments_names_and_revue_numbers_with_main_argument(arg1).should ==
          [["aux1", [1, 2]], ["aux2", [3]]]
      end
    end
  end

  describe "#arguments" do
    it "should return an array of main/aux args couple" do
      create(:argumentaire, article: article, main_argument: arg1, aux_argument: arg2)
      article.arguments.should == "arg1, arg2"
    end

    it "should return an the assigned EMPTY_ARGUMENTS_MESSAGE constant when main/aux args are empty" do
      article.arguments.should == Article::EMPTY_ARGUMENTS_MESSAGE
    end
  end
end
