namespace :db do
  desc "Importer la table de jointure authorships"
  task :import_authorships => :environment do
    require 'fastercsv'

    FasterCSV.foreach("authorships_to_import.csv") do |row|
      Authorship.create(
        :article_id => row[0],
        :author_id => row[1]
      )
    end
  end
end
