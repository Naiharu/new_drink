class RenameColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :items, :maker, :maker_id
  	rename_column :items, :category, :category_id
  end
end
