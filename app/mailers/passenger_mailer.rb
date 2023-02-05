class PassengerMailer < ApplicationMailer
  def confirmation_email
    @passenger = params[:passenger]
    @booking = params[:booking]
    mail to: @passenger.email, subject: 'Welcome to Flight Booker!'
  end
end
