class CraftsController < ApplicationController
  before_action :set_restaurant, only: %i[edit update show destroy]

  def index
    @crafts = Craft.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @craft = Craft.new
    authorize @restaurant
  end

  def create
    @craft = Craft.create(craft_params)
    authorize @restaurant
    redirect_to crafts_path
  end

  def edit; end

  def update
    @craft.update(params[:craft])
  end

  def destroy
    @craft.destroy
    redirect_to crafts_path
  end

  private

  def craft_params
    # Celui qui cree le craft c'est le current user
    params.require(:craft).permit(:description, :name, :price, :photo).merge(user: current_user)
  end

  def set_restaurant
    @craft = Craft.find(params[:id])
  end
end
