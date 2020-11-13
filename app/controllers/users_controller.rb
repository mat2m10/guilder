class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @crafts = @user.crafts
  end

  def all
    @user = User.find(params[:user_id])
    authorize @user
    @crafts = @user.crafts
  end

  def index
    @user = current_user
    @clients = policy_scope(User)

    @clients = @clients.where("bookings.created_at > ?", Time.at(params[:created_after].to_f)) if params[:created_after]
    respond_to do |format|
      format.html
      format.json { render json: { clients: @clients }}
    end
  end

  def edit
    authorize current_user
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
end
