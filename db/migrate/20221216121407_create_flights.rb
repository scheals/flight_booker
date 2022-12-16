class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :origin_id, null: false, foreign_key: true
      t.integer :destination_id, null: false, foreign_key: true
      t.timestamp :date, null: false
      t.integer :duration, null: false

      t.index %i[origin_id destination_id date], unique: true
      t.timestamps
    end
  end
end
