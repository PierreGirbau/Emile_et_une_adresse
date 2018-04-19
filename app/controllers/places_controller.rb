class PlacesController < ApplicationController
  before_action :set_place, only: [:show]
  skip_before_action :authenticate_user!, only: [:create, :new]

  def index
    @places = Place.all
    if params[:query].present? && params[:type_of_place].present?
      @places = Place.near(params[:query], 10, order: :distance)
      .where(type_of_place: params[:type_of_place])
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
    redirect_to place_path(@place)
  end

  def delete_saved_place
    @saved_place = SavedPlace.where(user_id: current_user)[0]
    @saved_place.visible = "false" if @saved_place.visible = "true"
    @saved_place.update_attribute(:visible, "false")
    respond_to do |format|
      format.html { redirect_to places_path }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
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

  private

  def place_params
    params.require(:place).permit(:google_place_id, :name, :address, :periods, :type_of_place, :website, :phone_number, :photo, :average_price)
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
