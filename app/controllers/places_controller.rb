class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :upvote, :downvote, :score]
  before_action :find_place_detail, only: [:new]
  skip_before_action :authenticate_user!, only: [:show, :index, :new, :create, :average_price, :compute_hearts]

  def oli
    
  end
  def index
    @places = []
    type_of_place = params[:query_2]
    if params[:query].present? && type_of_place.present?
      @places = Place.near(params[:query], 2)
        .where("type_of_place like ?", "%#{type_of_place}%")
    else
      render :index
    end
  end

  def show
    @place.total_heart = @place.total_heart  + (@place.get_upvotes.size - @place.get_downvotes.size)
  end

  def create
    @place = Place.new(place_params)
    @place_detail = Detail.find(params[:place_detail])
    @place_detail.update_columns(price: params[:place][:price])
    @shared_place = SharedPlace.new
    existing_place = Place.where(name: params[:place][:name]).first

    if @place.address == ""
      flash[:alert] = "Erreur de correspondance ou réseau. Merci de renseigner un autre endroit : bar, restaurant ou club."
      render :new

    elsif existing_place.nil?
      @place.total_heart = 0
      if @place.save
        @place_detail.update_columns(place_id: @place.id)
        average_price(@place)
        compute_hearts(@place)
        flash[:notice] = "Endroit ajouté avec succès !"
        redirect_to new_user_registration_app_path(@place_detail)
      else
        render :new
      end

    elsif (existing_place.name === @place.name)
      @place_detail.update_columns(place_id: existing_place.id)
      average_price(existing_place)
      compute_hearts(existing_place)
      flash[:notice] = "Endroit ajouté avec succès !"
      redirect_to new_user_registration_app_path(@place_detail)
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
    current_user.heart_stock = current_user.heart_capacity  if current_user.heart_capacity > 0
    current_user.save
    current_user.update_attribute(:heart_stock, current_user.heart_stock)
    flash[:notice] = "Vous venez de liker #{@place.name}. Vous ne pouvez liker qu'une fois chaque établissement !"

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

  private

  def average_price(place)
    average_price = 0
    place.details.each do |detail|
      average_price += detail.price
    end
    place.average_price = ( average_price / (place.details.count) ).to_i
    place.update_attribute(:average_price, place.average_price)
  end

  def compute_hearts(place)
    place.total_heart = place.total_heart + 1
    place.update_attribute(:total_heart, place.total_heart)
  end

  def place_params
    params.require(:place).permit(
      :type_of_place, :google_place_id, :name, :address, :periods, :comment, :price, :website, :phone_number, :photo, :average_price, :total_heart
    )
  end

  def set_place
    @place = Place.find(params[:id])
  end

  def find_place_detail
    @place_detail ||= Detail.find(params[:detail_id])
  end
end
