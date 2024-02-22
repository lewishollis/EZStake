# app/controllers/sweepstakes_controller.rb

class SweepstakesController < ApplicationController
  before_action :authenticate_user!

  def index
    @sweepstakes = Sweepstake.all
    respond_to do |format|
      format.turbo_stream
    end
  end

  def new
    @sweepstake = current_user.sweepstakes.build
  end

  def create
    @sweepstake = current_user.sweepstakes.build(sweepstake_params)

    if @sweepstake.save
      redirect_to sweepstakes_path, notice: 'Sweepstake created successfully.'
    else
      render :new
    end
  end

  private

  def sweepstake_params
    # Define the permitted parameters for a sweepstake
    params.require(:sweepstake).permit(:name, :description, :other_attributes)
  end
end
