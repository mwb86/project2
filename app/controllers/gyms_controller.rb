class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end
  def new
    @gym = Gym.new
  end
  def show
    @gym = Gym.find(params[:id])
  end
  def create
    @gym = Gym.new(gym_params)
    if @gym.save
      redirect_to @gym
    else
      render "new"
    end
  end
  def edit
  end
  def destroy
  end

private
  def gym_params
    params.require(:gym).permit(:name, :body)
  end
end
