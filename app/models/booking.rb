class Booking < ApplicationRecord
  belongs_to :flight

  validates :flight_id, presence: true
end
