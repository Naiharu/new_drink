class Starpulus < ActiveRecord::Migration[5.1]
  def change
  	add_column :reviews, :star4, :integer, null: false,  default: 0
  	add_column :reviews, :star5, :integer, null: false,  default: 0
  	add_column :reviews, :review_star4, :integer
  	add_column :reviews, :review_star5, :integer
  end
end
