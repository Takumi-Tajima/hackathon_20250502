class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :user_plan, null: false, foreign_key: true
      t.date :delivery_date, null: false
      t.string :status, null: false

      t.timestamps

      t.index %i[user_id delivery_date]
    end
  end
end
