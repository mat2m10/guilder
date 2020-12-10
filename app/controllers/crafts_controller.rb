class CraftsController < ApplicationController
  before_action :set_craft, only: %i[edit update show destroy]
  before_action :set_users, only: %i[index]
  skip_before_action :authenticate_user!, only: %i[index show new create]

  def index
    @crafts = policy_scope(Craft)

    put_markers

    if params[:query].present?
      sql_query = "name ILIKE :query OR address ILIKE :query"
      @crafts = Craft.where(sql_query, query: "%#{params[:query]}%")
    elsif params[:address].present?
      @crafts = Craft.near(params[:address], 2)
    else
      @crafts = Craft.all
    end
  end

  def show
    @craftman = User.find(@craft.user_id)
    @booking = Booking.new
    authorize @craft
  end

  def new
    @craft = Craft.new
    authorize @craft
  end

  def create
    @craft = Craft.create(craft_params)
    authorize @craft
    redirect_to crafts_path
  end

  def edit
    authorize @craft
  end

  def update
    @craft.update(craft_params)
    authorize @craft
    redirect_to @craft, notice: 'Your ad was successfully updated 😃'
  end

  def destroy
    authorize @craft
    @craft.destroy
    redirect_to crafts_path
  end

  private

  def craft_params
    # Celui qui cree le craft c'est le current user
    params.require(:craft).permit(:description, :name, :price, :photo).merge(user: current_user)
  end

  def set_craft
    @craft = Craft.find(params[:id])
  end

  def set_users
    @users = User.all
  end

  def put_markers
    if @crafts.present?
      @markers = @crafts.geocoded.map do |craft|
        {
          lat: craft.latitude,
          lng: craft.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { craft: craft }),
          image_url: helpers.asset_url('blacksmith.png')
        }
      end
    end
  end
end
