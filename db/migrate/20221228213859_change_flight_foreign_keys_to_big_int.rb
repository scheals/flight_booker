class ChangeFlightForeignKeysToBigInt < ActiveRecord::Migration[7.0]
  def change
    change_table :flights do |t|
      t.change :origin_id, :bigint
      t.change :destination_id, :bigint
    end
  end
end
