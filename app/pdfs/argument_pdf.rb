class ArgumentPdf < Prawn::Document
  def initialize(arguments)
    super(top_margin: 20)
    @arguments = arguments
    repeat :all do
      page_header
    end
    move_down 50
    arguments_list
  end

  def page_header
    font_size 18 do
      cell at: [0, bounds.top],
        width: bounds.width,
        content: "VIGItox : Index par arguments (à jour au #{I18n.l Date.today})",
        font_style: :bold,
        align: :center,
        border_color: "000000"
    end
  end

  def arguments_list
    column_box([0, cursor], columns: 2, width: bounds.width) do
      @arguments.all.each do |argument|
        revues_as_main = Article.revue_numbers_with_main_argument(argument)
        revues_as_aux = Article.aux_arguments_names_and_revue_numbers_with_main_argument(argument)
        unless revues_as_main.empty? && revues_as_aux.empty?
          text argument.name + " : " + revues_as_main
          indent 20 do
            revues_as_aux.each do |line|
              text "+ " + line[0] + " : " + line[1].join(", ")
            end
          end
        end
      end
    end
  end
end
