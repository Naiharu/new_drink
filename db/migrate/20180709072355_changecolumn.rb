class Changecolumn < ActiveRecord::Migration[5.1]
  def down
    remove_column :items, :user_id, :integer
  end
end
