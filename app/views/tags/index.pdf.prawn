#encoding: utf-8
pdf.text "VIGItox - Index par produits", :size => 30, :style => :bold

thetags = @tags.sort_by {|x| x.name.downcase}

tags = thetags.map do |tag|
  [
    tag.name,
    tag.articles.map(&:revue_id).sort.uniq.join(', ')
  ]
end

pdf.table tags, :align => { 0 => :left, 1 => :left},
  :row_colors => ["FFFFFF", "DDDDDD"],
  :headers => ["Produit", "N°"],
  :border_style => :underline_header
