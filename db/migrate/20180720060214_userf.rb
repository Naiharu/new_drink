class Userf < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :favorite, :string ,null: false
  end
end
