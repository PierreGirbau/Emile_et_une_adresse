class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:create, :new]

  def index
    @places = Place.all
  end

  def show

  end

  def create
    @place = Place.new(strong_params)
    @place.save
    redirect_to places_path
  end

  def new
    @place = Place.new
  end

  def destroy

  end

  def method_name

  end

  private

  def strong_params
    params.require(:place).permit(:name, :address, :type_of_place)
  end

  def set_place
    @place = Place.find(strong_params)
  end
end
