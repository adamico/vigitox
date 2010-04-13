pdf.repeat :all do
  pdf.font_size(24) do
    pdf.cell [0, pdf.bounds.top], :width => pdf.bounds.width,
      :text => "VIGItox - Articles #{@categorie.name}",
      :font_style => :bold, :text_color => "0078FF",
      :align => :center,
      :padding => 10,
      :border_color => "000000", :background_color => "FFCC33"
  end
end

articles = []

@categorie.articles.map do |a|
  articles << [ a.titre, a.revue.numero]
end

pdf.bounding_box [0,pdf.bounds.top-60], :width => pdf.bounds.width do
  pdf.table articles,
    :headers => [{:text => 'Titre', :font_style => :bold}, {:text => 'N°', :font_style => :bold}],
    :align_headers => { 0 => :left, 1 => :center},
    :align => { 0 => :left, 1 => :center},
    :row_colors => ['ffffff', 'cccccc'],
    :border_style => :underline_header,
    :vertical_padding => 0,
    :column_widths => { 0 => pdf.bounds.width*0.9, 1 => pdf.bounds.width*0.1}
end

