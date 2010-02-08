#encoding: utf-8
pdf.text "VIGItox - Index par arguments", :size => 30, :style => :bold


tags = @tags.map do |tag|
  [
    tag.name,
    tag.articles.map(&:revue_id).sort.join(', ')
  ]
end

pdf.table tags, :align => { 0 => :left, 1 => :left},
  :row_colors => ["FFFFFF", "DDDDDD"],
  :headers => ["Argument", "N°"],
  :border_style => :underline_header
