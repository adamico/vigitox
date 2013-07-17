FactoryGirl.define  do
  factory :admin, class: User do
    sequence(:email) {|n| "admin#{n}@test.com"}
    password "mysecretpassword1"
    password_confirmation "mysecretpassword1"
  end

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
    contenu "blablla"
    revue
    argumentaire
    ignore do
      categories_count 1
      authors_count 1
    end

    before(:create) do |article, evaluator|
      article.categorisations = create_list(:categorisation, evaluator.categories_count, article: article)
      article.authorships = create_list(:authorship, evaluator.authors_count, article: article)
    end
  end

  factory :categorisation do
    article
    categorie
  end

  factory :authorship do
    article
    author
  end

  factory :categorie do
    sequence(:name) {|n| "categorie#{n}"}
  end

  factory :argument, aliases: [:main_argument, :aux_argument] do
    sequence(:name) {|n| "argument#{n}"}
  end

  factory :argumentaire do
    main_argument
    aux_argument
  end
end
