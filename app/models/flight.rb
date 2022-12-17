class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'

  validates :origin_id, presence: true, uniqueness: { scope: %i[destination_id date] }

  scope :unique_flight_dates, -> { select(:date).order(:date).uniq(&:trim_milliseconds) }

  def short_date
    date.to_fs(:short)
  end

  def trim_milliseconds
    date.to_i
  end
end
