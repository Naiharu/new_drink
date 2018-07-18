class CreateMakers < ActiveRecord::Migration[5.1]
  def change
    create_table :makers do |t|
    	t.string :maker_name,:null => false

      t.timestamps
    end
  end
end
