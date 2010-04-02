pdf.text "VIGItox Index par arguments", :size => 30, :style => :bold

arguments = Argument.all(:order => "LOWER(name) ASC")

temp_list = []

arguments.each do |arg|
  temp_list << [arg.name, arg.articles_revue_numbers_as_main, arg.articles_aux_arguments_names_and_revue_numbers_as_main]
end

args_main = temp_list.delete_if { |a| Argument.find_by_name(a[0]).articles_as_main.empty? }


sep = ","

pdf.move_down(10)
#column_box([x,y]) where x,y = origin coordinates
pdf.column_box([0,pdf.cursor],
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
