class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :notes
      t.boolean :confirmed, default: false
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
