namespace :db do
  desc "Importer les articles de la vieille version"
  task :import_articles => :environment do
    require 'csv'

    CSV.foreach("articles.csv") do |row|
      Article.create(
        :titre => row[1],
        :revue_id => row[2],
        :contenu => "a mettre",
        :fiche_technique => row[3]
      )
    end
  end
end
