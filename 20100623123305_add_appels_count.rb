class AddAppelsCount < ActiveRecord::Migration
  def self.up
    models = %w(expo_types contextes)
    models.each do |model|
      add_column model, :appels_count, :integer, :default => 0
      klass = model.classify.constantize
      klass.reset_column_information
      klass.all.each do |instance|
        klass.update_counters instance.id, :appels_count => instance.appels.length
      end
    end
  end

  def self.down
    remove_column :contextes, :appels_count
    remove_column :expo_types, :appels_count
  end
end
