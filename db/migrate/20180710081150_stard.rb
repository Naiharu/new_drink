class Stard < ActiveRecord::Migration[5.1]
  def change
  	change_column :reviews, :review_star, :integer
  	add_column :reviews, :review_star2, :integer
  	add_column :reviews, :review_star3, :integer
  end
end
