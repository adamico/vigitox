FactoryGirl.define  do

  factory :author do
    sequence(:nom) {|n| "nom#{n}"}
    sequence(:prenom) {|n| "prenom#{n}"}
  end

  factory :revue do
    sequence(:numero) {|n| n}
    date_sortie Time.now.to_date
  end

  factory :article do
    sequence(:titre) {|n| "article#{n}"}
  end

end
