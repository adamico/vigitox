namespace :db do
  desc "Creation categories"
  task :populate_categories => :environment do
    
    cats = %w[CAP TV PV CEIP]

    cats.each do |cat|
      Categorie.create(:name => cat)
    end
  end
end
