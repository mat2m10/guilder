class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(craft_params)
    @booking.save
    redirect_to booking_path(@booking)
  end
end
