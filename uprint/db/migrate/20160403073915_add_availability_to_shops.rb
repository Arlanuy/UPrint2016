class AddAvailabilityToShops < ActiveRecord::Migration
  def change
    add_column :shops, :queue_status, :integer, :default => 0, :null => false
    add_column :shops, :is_available, :boolean
  end
end
