class CreateDeals < ActiveRecord::Migration[7.1]
  def change
    create_table :deals do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
