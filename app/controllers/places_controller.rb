class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:create, :new]

  def index
    @places = Place.all
    @user = current_user
    if (params[:query].present? && params[:query_2].present?)
      @places = Place.where(address: params[:query], type_of_place: params[:query_2])
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
    @saved_place.save
    @saved_place.visible = "true"
  end

  def delete_saved_place
    @saved_place.destroy if (@saved_place.visible == "false")
  end

  def show
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
    params.require(:place).permit(:google_place_id, :name, :address, :type_of_place)
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
