class BookingsController < ApplicationController
  before_action :set_craft, only: %i[new create]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(bookings_params)
    authorize @booking
    @booking.craft = @craft
    @booking.save
    redirect_to crafts_path, notice: 'Your request has been sent to the craftman 👍'
  end

  def show
    @craft = Booking.craft
    @user = Booking.user
    @booking = Booking.new
    authorize @craft
  end

  private

  def bookings_params
    params.require(:booking).permit(:date, :description)
  end

  def set_craft
    @craft = Craft.find(params[:craft_id])
  end
end
