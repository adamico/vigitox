#encoding: utf-8
pdf.text "VIGItox - Index par pathologie", :size => 30, :style => :bold

thepathologies = @pathologies.sort_by {|x| x.name.downcase}

pathologies = thepathologies.map do |path|
  [
    path.name,
    path.articles.map(&:revue_id).sort.uniq.join(', ')
  ]
end

pdf.table pathologies, :align => { 0 => :left, 1 => :left},
  :row_colors => ["FFFFFF", "DDDDDD"],
  :headers => ["Pathologie", "N°"],
  :border_style => :underline_header
