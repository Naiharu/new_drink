class Changelike < ActiveRecord::Migration[5.1]
  def change
    create_table :iines do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false

      t.timestamps

      t.index :user_id
      t.index :item_id
      t.index [:user_id, :item_id], unique: true
    end
  end
end
