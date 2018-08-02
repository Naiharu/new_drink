class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :follower_id
      t.integer :following_id


      t.timestamps null: false
    end


    add_index :relationships, :follower_id
    add_index :relationships, :following_id
    add_index :relationships, [:follower_id, :following_id], unique: true




  end
end
