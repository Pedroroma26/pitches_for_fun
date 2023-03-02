class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.total_price = (duration * @user.pitch.price)
    redirect_to users_path
  end

  def show
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:start_time, :end_time, :pitch_id)
  end
end
