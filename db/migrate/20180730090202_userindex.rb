class Userindex < ActiveRecord::Migration[5.1]
  def down
  	remove_index :users, :name, unique: true
  end
end
