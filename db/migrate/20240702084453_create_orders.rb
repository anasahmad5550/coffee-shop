class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 8, scale: 2
      t.integer :status, default: 0
      t.references :user, index: true
      t.timestamps
    end
  end
end
