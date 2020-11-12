class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end
  def all    
    @user = User.find(params[:user_id]) 
    @crafts = @user.crafts
    authorize @user
  end
end
