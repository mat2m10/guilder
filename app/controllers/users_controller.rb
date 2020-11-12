class UsersController < ApplicationController
  before_action :set_craft, only: %i[edit update show destroy]
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    authorize @user
    redirect_to @user, notice: 'Your ad was successfully updated 😃'
  end


  private

  def user_params
    # Celui qui cree le craft c'est le current user
    params.require(:user).permit(:description, :username, :about, :first_name, :last_name, :photo)
  end

  def set_craft
    @user = User.find(params[:id])
  end

end
