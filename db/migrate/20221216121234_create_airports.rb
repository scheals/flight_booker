# frozen_string_literal: true

class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
