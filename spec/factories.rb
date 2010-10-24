Factory.define :revue do |f|
  f.sequence(:numero) {|n| n}
  f.date_sortie Time.now.to_date
end

Factory.define(:article) do |a|
  a.sequence(:titre) {|n| "article#{n}"}
end

Factory.define(:categorie) do |c|
  c.name 'CAP'
end

Factory.define :argument do |f|
  f.sequence(:name) {|n| "argument#{n}"}
end
