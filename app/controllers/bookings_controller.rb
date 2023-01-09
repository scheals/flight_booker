class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight][:id].to_i)
    @passengers = params[:passengers]
    @booking = @flight.bookings.build
    @booking.passengers.build
  end

  def create
    @flight = Flight.find(booking_params[:flight_id])
    @passengers = booking_params[:passengers_attributes]
    @booking = @flight.bookings.build
    @booking.save
    @passengers.each do |passenger|
      if @booking.passengers.build(name: passenger[1][:name], email: passenger[1][:email]).save
        next
      else
        @booking.delete
        flash[:error] = "Something went wrong."
        return redirect_to new_booking_url(flight_id: @flight.id, passengers: @passengers.keys.length), status: :unprocessable_entity
      end
    end
    flash[:success] = "Successfully booked #{@flight.origin.name} to #{@flight.destination.name} on #{@flight.short_date}."
    redirect_to @booking
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
