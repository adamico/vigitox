require File.dirname(__FILE__) + '/../spec_helper'

describe Article do
  before(:each) do
    @article = Article.new
  end
  it "should be valid with titre" do
    @article.titre = "valuefortitre"
    @article.should be_valid
  end
  it "should return an array of main/aux args couple" do
    main_arg = Argument.create(:name => "mainarg")
    aux_arg = Argument.create(:name => "mainarg")
    @article.build_argumentaire
    @article.argumentaire.main_argument = main_arg
    @article.argumentaire.aux_argument = aux_arg
    @article.argumentaire.save
    @article.args_couple.should == [ main_arg, aux_arg]
  end
end


# == Schema Information
#
# Table name: articles
#
#  id              :integer         not null, primary key
#  titre           :text
#  revue_id        :integer
#  created_at      :datetime
#  updated_at      :datetime
#  contenu         :text
#  fiche_technique :boolean
#  position        :integer
#  author_id       :integer
#

