class Userimage < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :user_image_id, :string ,null: true
  end
end
