class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:create, :new]

  def index
    @places = Place.all
    if params[:query].present?
      @places = Place.where(address: params[:query])
    else
      @places = Place.all
    end
  end

  def show

  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to new_place_detail_path(@place)
    else
      render :new
    end
  end

  def new
    @place = Place.new
  end

  def destroy
    @place.destroy
    redirect_to places_path
  end

  def method_name

  end

  private

  def place_params
    params.require(:place).permit(:place_id, :address, :type_of_place)
  end

  def set_place
    @place = Place.find(place_params)
  end
end
