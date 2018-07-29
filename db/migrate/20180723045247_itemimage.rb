class Itemimage < ActiveRecord::Migration[5.1]
  def change
  	change_column :items, :item_image_id, :text ,null: true
  end
end
