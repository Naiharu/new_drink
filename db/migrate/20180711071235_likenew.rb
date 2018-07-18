class Likenew < ActiveRecord::Migration[5.1]
  def change
  	add_column :reviews, :like_count, :integer
  end
end
