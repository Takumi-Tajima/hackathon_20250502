class CreateUserPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :user_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :delivery_plan, null: false, foreign_key: true
      t.string :status, null: false

      t.timestamps

      t.index %i[user_id delivery_plan_id]
    end
  end
end
