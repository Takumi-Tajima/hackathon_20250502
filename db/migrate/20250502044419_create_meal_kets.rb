class CreateMealKets < ActiveRecord::Migration[8.0]
  def change
    create_table :meal_kets do |t|
      t.string :name, null: false, default: ''
      t.text :description, null: false, default: ''
      t.integer :price, null: false, default: 1
      t.boolean :is_frozen, null: false, default: false
      t.datetime :published_at

      t.timestamps
    end
  end
end
