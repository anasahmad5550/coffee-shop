class AddIsAvailableToDeals < ActiveRecord::Migration[7.1]
  def change
    add_column :deals, :is_available, :boolean, default: true
  end
end
