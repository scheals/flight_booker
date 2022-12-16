class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'

  validates :origin_id, presence: true, uniqueness: { scope: %i[destination_id date] }
end
