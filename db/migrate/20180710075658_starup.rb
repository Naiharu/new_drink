class Starup < ActiveRecord::Migration[5.1]
  def change
  	add_column :reviews, :star2, :integer
  	add_column :reviews, :star3, :integer
  end
end
