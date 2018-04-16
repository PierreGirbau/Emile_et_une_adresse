class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:create, :new]

  def index
    @places = Place.all

    if params[:query].present?
      @places = Place.where(google_place_id: params[:query].split(","))
      raise
    else
      @places = Place.all
    end
  end

  def saved_places
    @place = Place.find(params[:place_id])
    @user = current_user
    @saved_place = SavedPlace.new
    @saved_place.user = @user
    @saved_place.place = @place
    @saved_place.visible = "true"
    @saved_place.save
  end

  def average_price
    average_price = 0
    # binding.pry
    @place.details.each do |detail|
      average_price += detail.price
    end
    @place.average_price = ( average_price / (@place.details.count) ).to_f
    @place.update_attribute(:average_price, average_price)
    # raise
  end

  def show
    average_price
  end

  def create
    @place = Place.new(place_params)
    @shared_place = SharedPlace.new
    if @place.save
      @shared_place.place = @place
      @shared_place.user = current_user
      @shared_place.save
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

  private

  def place_params
    params.require(:place).permit(:google_place_id, :name, :address, :periods, :type_of_place, :website, :phone_number, :photo, :average_price)
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
