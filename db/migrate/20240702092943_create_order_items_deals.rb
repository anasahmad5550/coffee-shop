class CreateOrderItemsDeals < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items_deals do |t|
      t.references :orderable, polymorphic: true
      t.references :order, index: true
      t.integer :quantity, null: false, default: 1
      t.timestamps
    end
  end
end
