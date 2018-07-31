class Cal < ActiveRecord::Migration[5.1]
  def change
  	remove_column :items, :calorie, :string
  end
end
