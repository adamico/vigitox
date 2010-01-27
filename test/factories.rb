Factory.define(:revue) do |f|
  f.sequence(:numero) {|n| n}
  f.date_sortie Time.now.to_date
end

