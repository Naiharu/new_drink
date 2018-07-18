class AddIinesCountToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :iines_count, :integer,null: false, default: 0 unless column_exists? :items, :iines_count
  end
end
