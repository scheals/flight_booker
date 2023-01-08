class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight][:id].to_i)
    @passengers = params[:passengers]
  end

  def create
    @flight = Flight.find(params[:flight_id].to_i)
    @passengers = passenger_params
    @booking = @flight.bookings.build
    @booking.save
    @passengers.each do |passenger|
      if @booking.passengers.build(name: passenger[1][:name], email: passenger[1][:email]).save
        next
      else
        @booking.delete
        return redirect_to flights_bookings_new_url(flight_id: @flight.id, passengers: @passengers.keys.length), status: :unprocessable_entity
      end
    end
    redirect_to root_url
  end
end
