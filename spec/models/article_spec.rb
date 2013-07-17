require 'spec_helper'

describe Article do
  let(:revue)         { create(:revue, numero: "1") }
  let(:revue2)        { create(:revue, numero: "2") }
  let(:revue3)        { create(:revue, numero: "3") }
  let(:article)       { create(:article, revue: revue) }
  let(:article2)      { create(:article, revue: revue2) }
  let(:article3)      { create(:article, revue: revue3) }
  let(:main_arg)      { article.main_argument }
  let(:aux1)          { create(:argument, name: "aux1") }
  let(:aux2)          { create(:argument, name: "aux2") }

  it "requires a main argument" do
    article.argumentaire.main_argument_id = nil
    article.should_not be_valid
  end

  describe ".with_main_argument" do
    it "should list articles with the provided main argument" do
      Article.with_main_argument(main_arg).should == [article]
    end
  end

  describe ".with_aux_argument" do
    it "should list articles with the provided aux argument" do
      article.argumentaire.aux_argument = aux1
      article.save!
      Article.with_aux_argument(aux1).should == [article]
    end
  end

  describe ".revue_numbers_with_main_argument" do
    it "should print revue numbers for articles with only the main argument provided" do
      article.argumentaire.aux_argument.destroy
      article.save!
      Article.revue_numbers_with_main_argument(main_arg).should == "1"
    end
  end

  describe ".aux_arguments_names_and_revue_numbers_with_main_argument" do
    before do
      article.argumentaire.aux_argument = aux1
      article.save!
    end
    context "when main/aux couple is unique" do
      it "should return an array [[aux1.name, [revue.numero]], [aux2.name, [revue2.numero]]]" do
        article2.argumentaire.main_argument = main_arg
        article2.argumentaire.aux_argument = aux2
        article2.save!
        Article.aux_arguments_names_and_revue_numbers_with_main_argument(main_arg).should ==
          [["aux1", [1]], ["aux2", [2]]]
      end
    end
    context "when multiple main/aux couples are found" do
      it "should return an array [aux argument name, [revue numbers]]" do
        article2.argumentaire.main_argument = main_arg
        article2.argumentaire.aux_argument = aux1
        article2.save!
        article3.argumentaire.main_argument = main_arg
        article3.argumentaire.aux_argument = aux2
        article3.save!
        Article.aux_arguments_names_and_revue_numbers_with_main_argument(main_arg).should ==
          [["aux1", [1, 2]], ["aux2", [3]]]
      end
    end
  end

  describe "#arguments" do
    it "should return an array of main/aux args couple" do
      article.argumentaire.aux_argument = aux1
      article.save!
      article.arguments.should == "#{main_arg.name}, aux1"
    end
  end
end
