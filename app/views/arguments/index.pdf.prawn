pdf.repeat :all do
  pdf.font_size(24) do
    pdf.cell [0, pdf.bounds.top], :width => pdf.bounds.width,
      :text => "VIGItox - Index par arguments",
      :font_style => :bold, :text_color => "0078FF",
      :align => :center,
      :padding => 10,
      :border_color => "000000", :background_color => "FFCC33"
  end
end

arguments = Argument.all(:order => "LOWER(name) ASC")

temp_list = []

arguments.each do |arg|
  temp_list << [arg.name, arg.articles_revue_numbers_as_main, arg.articles_aux_arguments_names_and_revue_numbers_as_main]
end

args_main = temp_list.delete_if { |a| Argument.find_by_name(a[0]).articles_as_main.empty? }


sep = ","

#column_box([x,y]) where x,y = origin coordinates
pdf.column_box([0,pdf.bounds.top-58],
               :columns => 2,
               :spacer => 3,
               :width => pdf.bounds.width
              ) do
  args_main.each do |a|
    pdf.text "#{a[0]}#{sep} #{a[1]}"
    a[2].each do |aux|
      pdf.indent(20) do
        pdf.text "+ #{aux[0]}#{sep} #{aux[1].join(', ')}"
      end
    end
  end
end
