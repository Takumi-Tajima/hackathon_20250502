class CreateDeliveryPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_plans do |t|
      t.string :name, null: false, default: ''
      t.text :description, null: false, default: ''
      t.string :delivery_frequency, null: false
      t.integer :price, null: false, default: 1
      t.boolean :published, null: false, default: false

      t.timestamps
    end
  end
end
