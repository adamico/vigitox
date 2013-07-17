require 'spec_helper'

describe Revue do
  let!(:revue)         { create(:revue, numero: 3, date_sortie: Date.today) }
  let!(:prev_revue)    { create(:revue, numero: 2) }
  let!(:next_revue)    { create(:revue, numero: 4) }

  describe ".prev" do
    it "should return the previous numbered revue" do
      Revue.prev(revue).should == prev_revue
    end

    it "should return the next numbered revue" do
      Revue.next(revue).should == next_revue
    end
  end

  describe "#annee_sortie" do
    it "should return the beginning of year date for the date_sortie" do
      revue.annee_sortie.should == Date.today.beginning_of_year
    end
  end
end
