class FlightsController < ApplicationController
  def index
    @ordered_airports = Airport.all.order(:name)
    @flights = Flight.all
    @unique_flight_dates = @flights.unique_flight_dates
  end
end
