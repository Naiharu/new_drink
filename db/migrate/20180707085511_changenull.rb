class Changenull < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :email, :string, null: true
    change_column :users, :user_image_id, :text, null: true  
  end
end
