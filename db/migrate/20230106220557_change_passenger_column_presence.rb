class ChangePassengerColumnPresence < ActiveRecord::Migration[7.0]
  def change
    change_table :passengers do |t|
      t.change_null :name, false
      t.change_null :email, false
    end
  end
end
