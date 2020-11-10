class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @craft = Craft.find(params[:craft_id])
  end

  def create
    @booking = Booking.new(bookings_params)
    @craft = Craft.find(params[:craft_id])
    @booking.craft = @craft
    @booking.save    
    redirect_to crafts_path
  end

  def bookings_params
    params.require(:booking).permit(:date, :duration)
  end
end
