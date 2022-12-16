class FlightsController < ApplicationController
  def index
    @ordered_airports = Airport.all.order(:name)
    @flights = Flight.all
    @unique_flight_days = @flights.select(:date).order(:date).uniq(&:trim_milliseconds)
  end
end
