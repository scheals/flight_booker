# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :origin, class_name: "Airport"
  belongs_to :destination, class_name: "Airport"

  validates :origin_id, presence: true, uniqueness: { scope: %i[destination_id date] }

  scope :unique_flight_dates, -> { select(:date).order(:date).uniq(&:numeric_date) }
  scope :matching_routes, ->(origin, destination) { where(origin_id: origin, destination_id: destination) }
  scope :matching_flights_for_date, ->(flights, date) { flights&.select { |flight| flight.matching_date?(date) } }

  def short_date
    date.to_fs(:short)
  end

  def numeric_date
    date.to_i
  end

  def matching_date?(other_date)
    date.to_i == other_date.to_i
  end
end
