require File.dirname(__FILE__) + '/../spec_helper'

describe Article do
  it "should be valid" do
    Article.new.should be_valid
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
#

