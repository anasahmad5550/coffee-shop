class CreateDealItems < ActiveRecord::Migration[7.1]
  def change
    create_table :deal_items do |t|
      t.references :deal, index: true
      t.references :item, index: true
      t.boolean :is_free
      t.decimal :discount_percentage, precision: 5, scale: 2
      t.timestamps
    end
  end
end
