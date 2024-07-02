class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :category, null: false
      t.decimal :price, precision: 8, scale: 2
      t.decimal :tax , precision: 5, scale: 2
      t.boolean :is_available, default: true
      t.timestamps
    end
  end
end
