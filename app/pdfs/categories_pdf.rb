class CategoriesPdf < Prawn::Document
  def initialize(categories)
    super(top_margin: 20)
    @categories = categories
    page_header
    move_down 50

    @categories.each do |categorie|
      categories_list(categorie)
    end
  end

  def page_header
    font_size 18 do
      cell at: [0, bounds.top],
        width: bounds.width,
        content: "VIGItox : Liste articles par catégorie (à jour au #{I18n.l Date.today})",
        font_style: :bold,
        align: :center,
        border_color: "000000"
    end
  end

  def categories_list(categorie)
    articles_table(categorie)
  end

  def articles_table(categorie)
    data = []

    data << [categorie.name.titleize, ""]

    for article in categorie.articles do
      data << [article.full_title, article.revue_numero]
    end

    table data, header: true, row_colors: ["D0D0D0", "FFFFFF"] do
      cells.style do |cell|
        cell.border_width = 0
      end
      row(0).borders = [:bottom]
      row(0).border_width = 2
      row(0).font_style = :bold
    end

    move_down 20
  end
end
