namespace :db do
  desc "Importer les autheurs de la vieille version"
  task :import_authors => :environment do
    require 'fastercsv'

    FasterCSV.foreach("authors.csv") do |row|
      Author.create(
        :nom => row[1],
        :prenom => row[2]
      )
    end
  end
end
