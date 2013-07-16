require 'spec_helper'

describe Author do
  subject {create(:author, nom: "Dupond", prenom: "Martin")}

  describe "#short_name" do
    context "with a single first name" do
      it "should return first name initial with last name" do
        subject.short_name.should == "M. Dupond"
      end
    end
    context "with a composed first name" do
      context "when first names are separated by '-'" do
        it "should return first name initial with last name" do
          subject.prenom = "Jean-Marc"
          subject.short_name.should == "J.-M. Dupond"
        end
      end
      context "when first names are separated by blank space" do
        it "should return first name initial with last name" do
          subject.prenom = "Jean Marc"
          subject.short_name.should == "J.-M. Dupond"
        end
      end
    end
  end

  describe "#nom_and_prenom" do
    it "should return nom joined with prenom separated by blank space" do
      subject.nom_and_prenom.should == "Dupond Martin"
    end
  end
end
