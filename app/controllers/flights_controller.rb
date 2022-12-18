class FlightsController < ApplicationController
  def index
    @ordered_airports = Airport.all.order(:name)
    @flights = Flight.all
    @unique_flight_dates = @flights.unique_flight_dates
    return unless params[:search_results]

    @search_results = params[:search_results].map(&:to_i).map { |id| Flight.find(id) }
  end

  def find_flights
    @flights = Flight.all
    @search_results = @flights.matching_flights_for_date(@flights.matching_routes(params[:origin_id], params[:destination_id]), params[:date])
    redirect_to root_path(search_results: @search_results)
  end
end
