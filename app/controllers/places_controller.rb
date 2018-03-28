class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :destroy]
  def index
    @places = Place.all
  end

  def show

  end

  def create

  end

  def new

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
