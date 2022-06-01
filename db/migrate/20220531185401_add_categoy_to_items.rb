class AddCategoyToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :category, :string
  end
end
