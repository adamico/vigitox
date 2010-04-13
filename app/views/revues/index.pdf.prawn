pdf.repeat :all do
  pdf.font_size(24) do
    pdf.cell [0, pdf.bounds.top], :width => pdf.bounds.width,
      :text => "VIGItox - Liste des articles",
      :font_style => :bold, :text_color => "0078FF",
      :align => :center,
      :padding => 10,
      :border_color => "000000", :background_color => "FFCC33"
  end
end

revues = Revue.all(:order => "numero DESC")

pdf.bounding_box [0,pdf.bounds.top-60], :width => pdf.bounds.width do
  revues.each do |r|
    articles = []
    r.articles.map do |a|
      articles << [ a.titre, "" ]
    end
    header = pdf.cell [0, pdf.cursor], :width => pdf.bounds.width,
      :text => "VIGItox n°#{r.numero}", :font_style => :bold,
      :borders => [:top, :bottom]
    pdf.table articles,
      :row_colors => ['ffffff', 'cccccc'],
      :border_style => :underline_header,
      :horizontal_padding => 20,
      :vertical_padding => 0,
      :column_widths => { 0 => pdf.bounds.width, 1 => 0}
  end
end
