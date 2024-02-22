class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @user_sweepstakes = @user.sweepstakes
  end

  def edit
    # Render the form for editing user profile
  end

  def update
    if current_user.update(profile_params)
      redirect_to profile_path, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :avatar) # Add other profile attributes as needed
  end
end
