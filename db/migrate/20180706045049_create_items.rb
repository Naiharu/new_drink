class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :admin_id, :null => false
      t.integer :user_id, :null => false
      t.text :item_image_id, :null => false
      t.string :title, :null => false
      t.integer :category, :null => false
      t.integer :maker, :null => false
      t.integer :price, :null => false
      t.string :calorie, :null => false
      t.text :comment, :null => false
      t.string :age, :null => false

      t.timestamps
    end
  end
end
