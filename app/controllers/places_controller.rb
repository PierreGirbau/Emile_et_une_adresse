class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :upvote, :downvote, :score]
  skip_before_action :authenticate_user!, only: [:create, :new]

  def index
    @places = Place.all
    if params[:query].present? && params[:type_of_place].present?
      @places = Place.near(params[:query], 2)
      .where(type_of_place: params[:type_of_place])
    else
      @places = Place.all
    end
  end

  def average_price
    average_price = 0
    @place.details.each do |detail|
      average_price += detail.price
    end
    @place.average_price = ( average_price / (@place.details.count) ).round
    @place.update_attribute(:average_price, @place.average_price)
  end

  def show
    average_price
    score
  end

  def create
    @place = Place.new(place_params)
    @shared_place = SharedPlace.new
    @place.total_heart = 1
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

  def upvote
    @place.upvote_by current_user

    # updating hearts of the current_user // ne marche pas encore!
    current_user.heart_stock = (current_user.heart_capacity - 1) if current_user.heart_capacity > 0
    current_user.save
    current_user.update_attribute(:heart_stock, current_user.heart_stock)

    # updating hearts of the places
    @place.update_attribute(:total_heart, @place.total_heart)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_path) }
      format.json { render json: { count: @place.liked_count } }
    end
  end

  def downvote
    @place.downvote_by current_user
    current_user.heart_stock += current_user.heart_capacity
    # redirect_to :back
    @place.update_attribute(:total_heart, @place.total_heart)
    # redirect_to :back
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_path) }
      format.json { render json: { count: @place.liked_count } }
    end
  end

  def score
    @place.total_heart = @place.get_upvotes.size - @place.get_downvotes.size
    @place.update_attribute(:total_heart, @place.total_heart)
  end

  private

  def place_params
    params.require(:place).permit(:google_place_id, :name, :address, :periods, :type_of_place, :website, :phone_number, :photo, :average_price, :total_heart)
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
