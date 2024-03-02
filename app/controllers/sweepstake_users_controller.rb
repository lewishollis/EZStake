# app/controllers/sweepstake_users_controller.rb
class SweepstakeUsersController < ApplicationController
  before_action :set_sweepstake

  def add_user
    user = User.find(params[:user_id])

    if @sweepstake.users.include?(user)
      flash[:alert] = "User is already added to this sweepstake."
    else
      @sweepstake.users << user
      flash[:notice] = "User added successfully."
    end

    redirect_to sweepstake_path(@sweepstake)
  end

  def remove_user
    user = User.find(params[:user_id])

    if @sweepstake.users.include?(user)
      @sweepstake.users.delete(user)
      flash[:notice] = "User removed successfully."
    else
      flash[:alert] = "User is not associated with this sweepstake."
    end

    redirect_to sweepstake_path(@sweepstake)
  end

  private

  def set_sweepstake
    @sweepstake = Sweepstake.find(params[:id])
  end
end
