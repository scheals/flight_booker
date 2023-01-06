class Passenger < ApplicationRecord
  belongs_to :booking

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, length: { minimum: 6 }
  validates :booking_id, presence: true
  validates :name, uniqueness: { scope: %i[email booking_id] }
end
