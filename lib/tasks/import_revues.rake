namespace :db do
  
  desc "Importer les revues de la precedente version vigitox index"
  task :import_revues => :environment do
    require 'csv'
    
    CSV.foreach("revues.csv") do |row|
      Revue.create(
        :numero => row[0],
        :date_sortie => row[1]
      )
    end
  end
end
