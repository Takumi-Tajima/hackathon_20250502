class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :region, null: false
      t.string :detail, null: false, default: ''
      t.boolean :is_primary, null: false, default: false

      t.timestamps
    end
  end
end
