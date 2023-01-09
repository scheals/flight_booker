# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    @ordered_airports = Airport.all.order(:name)
    @flights = Flight.all
    @unique_flight_dates = @flights.unique_flight_dates
    @search_results = @flights.matching_flights_for_date(@flights.matching_routes(params[:origin_id], params[:destination_id]), params[:date])
  end
end
