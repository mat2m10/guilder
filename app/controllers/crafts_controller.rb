class CraftsController < ApplicationController
  before_action :set_restaurant, only: [:edit, :update, :show, :destory]!

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
    @craft = Craft.new(craft_params)
    authorize @restaurant
    @craft.save
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
