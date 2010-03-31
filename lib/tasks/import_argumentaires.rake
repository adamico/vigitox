namespace :db do
  desc "Importer les argumentaire à partir des tags existants"
  task :import_argumentaires => :environment do
    Article.all.each do |article|
      main_tag = article.tags.first
      aux_tag = article.pathologies.first
      main_arg = Argument.find_or_create_by_name(main_tag.name) unless main_tag.nil?
      aux_arg = Argument.find_or_create_by_name(aux_tag.name) unless aux_tag.nil?
      article.build_argumentaire
      article.argumentaire.main_argument = main_arg
      article.argumentaire.aux_argument = aux_arg unless aux_arg.nil?
      article.argumentaire.save
    end
  end
end
