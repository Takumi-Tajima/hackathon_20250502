class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :meal_ket, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.integer :price, null: false

      t.timestamps

      t.index %i[order_id meal_ket_id]
    end
  end
end
