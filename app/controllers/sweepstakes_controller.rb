# app/controllers/sweepstakes_controller.rb

class SweepstakesController < ApplicationController
  before_action :authenticate_user!

  def new
    @sweepstake = Sweepstake.new
  end

  def index
    @sweepstakes = Sweepstake.all

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @user = User.find(params[:id])
    @user_sweepstakes = @user.sweepstakes
  end

  def create
    @sweepstake = current_user.sweepstakes.build(sweepstake_params)

    if @sweepstake.save
      redirect_to sweepstakes_path, notice: 'Sweepstake created successfully.'
    else
      puts @sweepstake.errors.full_messages

      render :new
    end
  end

private

  def sweepstake_params
    params.require(:sweepstake).permit(:name, :description, :start_date, :end_date, :api_url).merge(user_id: current_user.id)
  end

end
