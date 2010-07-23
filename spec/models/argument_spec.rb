require 'spec_helper'

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
  describe "#articles_" do
    before(:each) do
      @argument.save
      @revue1 = Revue.create(:numero => 1)
      @article1 = @revue1.articles.create(:titre => "letitre")
      @revue2 = Revue.create(:numero => 2)
      @article2 = @revue2.articles.create(:titre => "letitre2")
      @article1.build_argumentaire
      @article2.build_argumentaire
    end
    context "as_main" do
      it "should list articles where it figures as main argument" do
        @article1.argumentaire.main_argument = @argument
        @article1.argumentaire.save
        @argument.articles_as_main.should == [ @article1 ]
      end
    end
    context "as_aux" do
      it "should list articles where it figures as aux argument" do
        @article1.argumentaire.aux_argument = @argument
        @article1.argumentaire.save
        @argument.articles_as_aux.should == [ @article1 ]
      end
    end
    context "revue_numbers_as_main" do
      it "should print revue number for articles where it figures as main argument" do
        @article1.argumentaire.main_argument = @argument
        @article1.argumentaire.save
        @article2.argumentaire.main_argument = @argument
        @article2.argumentaire.save
        @argument.articles_revue_numbers_as_main.should == "1, 2"
      end
    end
    describe "aux_arguments_names_and_revue_numbers_as_main" do
      before(:each) do
        @aux1 = Argument.create(:name => "aux1")
        @aux2 = Argument.create(:name => "aux2")
      end
      context "when main/aux couple is unique" do
        it "should return an array [aux argument name, [revue number]]" do
          @article1.argumentaire.main_argument = @argument
          @article1.argumentaire.aux_argument = @aux1
          @article1.argumentaire.save
          @article2.argumentaire.main_argument = @argument
          @article2.argumentaire.aux_argument = @aux2
          @article2.argumentaire.save
          @argument.articles_aux_arguments_names_and_revue_numbers_as_main.should == [ [@aux1.name, [@revue1.numero]], [@aux2.name, [@revue2.numero]]]
        end
      end
      context "when multiple main/aux couples are found" do
        it "should return an array [aux argument name, [revue numbers]]" do
          @article1.argumentaire.main_argument = @argument
          @article1.argumentaire.aux_argument = @aux1
          @article1.argumentaire.save
          @article2.argumentaire.main_argument = @argument
          @article2.argumentaire.aux_argument = @aux1
          @article2.argumentaire.save
          @article3 = @revue1.articles.create(:titre => "letitre")
          @article3.build_argumentaire
          @article3.argumentaire.main_argument = @argument
          @article3.argumentaire.aux_argument = @aux2
          @article3.argumentaire.save
          @argument.articles_aux_arguments_names_and_revue_numbers_as_main.should == [ [@aux1.name, [@revue1.numero, @revue2.numero]], [@aux2.name, [@revue1.numero]] ]
        end
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

