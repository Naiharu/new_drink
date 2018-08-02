class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.integer :user_id,:null => false
    	t.integer :item_id,:null => false
    	t.integer :star,:null => false
    	t.text :item_review,:null => false

      t.timestamps
    end
  end
end
