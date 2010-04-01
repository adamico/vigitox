pdf.text "VIGItox Index par arguments", :size => 30, :style => :bold

arguments = Argument.all(:order => "LOWER(name) ASC")

temp_list = []

arguments.each do |arg|
  temp_list << [arg.name, arg.article_revue_numbers_as_main]
end

args_main = temp_list.delete_if { |a| a[1] == ""}


sep = " : "

pdf.move_down(10)
#column_box([x,y]) where x,y = origin coordinates
pdf.column_box([0,pdf.cursor],
               :columns => 2,
               :spacer => 3,
               :width => pdf.bounds.width
              ) do
  args_main.each do |a|
    pdf.text "#{a[0]} #{sep} #{a[1]}"
    pdf.indent(20) do
      pdf.text "subargs + revue numbers"
    end
  end
end
