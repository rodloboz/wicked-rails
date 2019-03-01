class RacesController < ApplicationController
  before_action :set_race, only: [:show, :edit, :update, :destroy]

  def index
    @races = Race.all
  end

  def show
    @checkpoints = @race.checkpoints.map do |checkpoint|
      {
        lng: checkpoint.longitude,
        lat: checkpoint.latitude
      }
    end
    @players = [
      {
        image_url: helpers.asset_url('current-location.png')
      }
    ]

    redirect_to races_path if @checkpoints.size != @race.checkpoints.size
  end

  def new
    @race = Race.new
    @race.checkpoints.build
  end

  def create
    @race = Race.new(race_params)
    if @race.save
      redirect_to races_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @race.update(race_params)
      redirect_to races_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_race
    @race = Race.find(params[:id])
  end

  def race_params
    params.require(:race).permit(:name, checkpoints_attributes: [:id, :position, :location, :_destroy,])
  end
end
