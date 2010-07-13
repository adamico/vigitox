class AddArticlesCount < ActiveRecord::Migration
  def self.up
    models = %w(revues)
    models.each do |model|
      add_column model, :articles_count, :integer, :default => 0
      klass = model.classify.constantize
      klass.reset_column_information
      klass.all.each do |instance|
        klass.update_counters instance.id, :articles_count => instance.articles.length
      end
    end
  end

  def self.down
    remove_column :revues, :articles_count
  end
end
