class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.text :name
      t.text :email
      t.references :booking, null: false, foreign_key: true

      t.index %i[name email booking_id], unique: true
      t.timestamps
    end
  end
end
