class CraftsController < ApplicationController
  def index
    @crafts = Craft.all
  end

  def show
    @craft = Craft.find(params[:id])
  end

  def new
    @craft = Craft.new
  end

  def create
    @craft = Craft.new(craft_params)
    @craft.save
    redirect_to craft_path(@craft)
  end

  def edit
    @craft = Craft.find(params[:id])
  end

  def update
    @craft = Craft.find(params[:id])
    @craft.update(params[:craft])
  end

  def destroy
    @craft = Craft.find(params[:id])
    @craft.destroy
    redirect_to crafts_path
  end

  private

  def craft_params
    params.require(:craft).permit(:name, :price)
  end

end
