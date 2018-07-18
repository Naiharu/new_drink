class Adminnull < ActiveRecord::Migration[5.1]
  def change
  	change_column :admins, :email, :string, null: true
  end
end
