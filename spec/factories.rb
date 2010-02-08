Factory.define :revue do |f|
  f.sequence(:numero) {|n| n}
  f.date_sortie Time.now.to_date
end

Factory.define(:article) do |a|
  a.sequence(:titre) {|n| "article#{n}"}
  a.association :revue
  a.categories {|cats| [cats.association(:categorie)]}
  a.tags {|tags| [tags.association(:tag)]}
end

Factory.define(:categorie) do |c|
  c.name 'CAP'
end

Factory.define(:tag) do |t|
  t.name 'atag'
end

