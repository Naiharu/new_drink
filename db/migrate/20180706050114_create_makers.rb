class CreateMakers < ActiveRecord::Migration[5.1]
  def change
    create_table :makers, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.string :maker_name,:null => false

      t.timestamps
    end
  end
end
