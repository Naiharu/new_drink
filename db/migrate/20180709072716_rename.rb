class Rename < ActiveRecord::Migration[5.1]
   def up
    remove_column :items, :user_id
      end

  def down
    add_column :items, :user_id, :integer
  end
end
