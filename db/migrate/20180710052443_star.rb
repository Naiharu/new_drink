class Star < ActiveRecord::Migration[5.1]
  def change
  	add_column :reviews, :review_star, :string
  end
end
