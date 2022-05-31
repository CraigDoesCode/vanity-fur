class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :price
      t.string :name
      t.string :size
      t.boolean :availability
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
