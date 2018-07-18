class Stardefault < ActiveRecord::Migration[5.1]
  def change
  	change_column :reviews, :star, :integer,default: 0
	change_column :reviews, :star2,:integer, null: false,  default: 0
	change_column :reviews, :star3,:integer, null: false,  default: 0
  end
end
