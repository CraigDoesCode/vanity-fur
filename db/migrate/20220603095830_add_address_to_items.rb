class AddAddressToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :latitude, :float
    add_column :items, :longitude, :float
    add_column :items, :address, :string
  end
end
