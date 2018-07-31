class Userindexmiss < ActiveRecord::Migration[5.1]
  def change
  	remove_index :users, column: :name, unique: true
  end
end
