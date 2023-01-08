class AddCascadeToPassengers < ActiveRecord::Migration[7.0]
  def up
    remove_foreign_key :passengers, :bookings
    add_foreign_key :passengers, :bookings, on_delete: :cascade, null: false
  end

  def down
    remove_foreign_key :passengers, :bookings
    add_foreign_key :passengers, :bookings
  end
end
