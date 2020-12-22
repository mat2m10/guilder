class BookingsController < ApplicationController
  before_action :set_craft, only: %i[new create]
  skip_before_action :authenticate_user!, only: %i[show new create]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @available_dates = set_dates
    @booking = Booking.new(bookings_params)
    authorize @booking
    @booking.craft = @craft
    @booking.user = current_user
    @booking.date = '29/10/1923'
    @booking.save
    redirect_to crafts_path, notice: 'Your request has been sent to the craftman 👍'
  end

  def show
    @booking = Booking.find
    @craft = Booking.craft
    @user = Booking.user
    @booking = Booking.new
    authorize @craft
  end

  def bookings_params
    params.require(:booking).permit(:date, :description)
  end

  private

  def set_craft
    @craft = Craft.find(params[:craft_id])
  end

  def set_dates
    date = DateTime.now
    date_hash = []
    7.times do
      date_hash << { date: date, available: true }
      date = date.next_day(1)
    end
    return date_hash
  end

end
