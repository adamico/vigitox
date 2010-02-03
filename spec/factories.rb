Factory.define :revue do |f|
  f.sequence(:numero) {|n| n}
  f.date_sortie Time.now.to_date
end

Factory.define(:article) do |a|
  a.sequence(:titre) {|n| "article#{n}"}
  a.association :revue
end

Factory.define(:categorie) do |c|
  c.name 'CAP'
end

