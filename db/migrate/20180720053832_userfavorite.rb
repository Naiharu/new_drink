class Userfavorite < ActiveRecord::Migration[5.1]
  def change
  	 add_column :users, :favorite, :string
  	 add_column :items, :url, :string
  end
end
