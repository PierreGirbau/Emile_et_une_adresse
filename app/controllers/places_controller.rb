class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :upvote, :downvote, :score]
  before_action :find_place_detail, only: [:new]
  skip_before_action :authenticate_user!, only: [:edit, :update, :show, :new, :create, :average_price, :compute_hearts]

  def oli

  end
  def index
    @places = []
    # if params[:place]
    #   type_of_place = params[:place][:type_of_place]
    # end
    # @query = params[:query]
    # # if params[:query] == "" && type_of_place.present?
    # # if params[:place] == "" && type_of_place.present?
    # # if type_of_place.present?

    # if params[:query] && type_of_place.present?
    #   @places = Place.near(params[:query], 1.5)
    #     .where("type_of_place like ?", "%#{type_of_place}%")
    #   # @places = Place.where(type_of_place: type_of_place)
    # else
    #   render :index
    #   # @places = Place.all
    # end

    type_of_place = params[:type_of_place]
    if params[:query] && params[:type_of_place]
      @places = Place.near(params[:query], 1.5).where("type_of_place like ?", "%#{type_of_place}%")
    else
      render :index
    end
  end

  def show
    @place.total_heart = @place.total_heart  + (@place.get_upvotes.size - @place.get_downvotes.size)
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    redirect_to place_path(@place)
  end

  def create
    @place = Place.new(place_params)
    @place_detail = Detail.find(params[:place_detail])
    @place_detail.update_columns(price: params[:place][:price])
    @shared_place = SharedPlace.new
    existing_place = Place.find_by(name: params[:place][:name])
    existing_places = Place.where(name: params[:place][:name]).all

    if @place.address == ""
      flash[:alert] = "Erreur de correspondance ou réseau. Merci de renseigner un autre endroit : bar, restaurant ou club."
      render :new

    elsif existing_place.nil?
      @place.total_heart = 0
      @place.type_of_place = @place_detail.type_of_place

      if @place.save
        @place_detail.update_columns(place_id: @place.id, comment: @place.comment)
        average_price(@place)
        compute_hearts(@place)

        if user_signed_in?

          @place = @place_detail.place
          @place.update_columns(type_of_place: @place_detail.type_of_place)
          @shared_place.place = @place
          @shared_place.user = current_user
          @shared_place.save
          @place_detail.update_columns(user_id: current_user.id)

          redirect_to place_path(@place)

        else
          redirect_to new_user_registration_app_path(@place_detail)
        end
      else
        render :new
      end


    elsif (existing_place.name === @place.name)



      #start
      if user_signed_in? && current_user.places.include?(existing_place)
        redirect_to alreadyshared_path
      else

                existing_place_table = Place.find_by(name: params[:place][:name], type_of_place: 'une bonne table')
                existing_place_drink = Place.find_by(name: params[:place][:name], type_of_place: 'un bon verre')
                existing_place_club = Place.find_by(name: params[:place][:name], type_of_place: 'un bon artisan')
                # binding.pry

                if existing_place_table.present? && (@place_detail.type_of_place == existing_place_table.type_of_place)
                  @place_detail.update_columns(place_id: existing_place_table.id, comment: params[:place][:comment])
                  average_price(existing_place_table)
                  compute_hearts(existing_place_table)



                  if user_signed_in?

                    @place = @place_detail.place
                    @place.update_columns(type_of_place: @place_detail.type_of_place)
                    @shared_place.place = @place
                    @shared_place.user = current_user
                    @shared_place.save
                    @place_detail.update_columns(user_id: current_user.id)

                    redirect_to place_path(@place)
                  else
                    redirect_to new_user_registration_app_path(@place_detail)
                  end

                elsif existing_place_drink.present? && (@place_detail.type_of_place == existing_place_drink.type_of_place)
                  @place_detail.update_columns(place_id: existing_place_drink.id, comment: params[:place][:comment])
                  average_price(existing_place_drink)
                  compute_hearts(existing_place_drink)

                  if user_signed_in?

                    @place = @place_detail.place
                    @place.update_columns(type_of_place: @place_detail.type_of_place)
                    @shared_place.place = @place
                    @shared_place.user = current_user
                    @shared_place.save
                    @place_detail.update_columns(user_id: current_user.id)

                    redirect_to place_path(@place)

                  else
                    redirect_to new_user_registration_app_path(@place_detail)
                  end

                elsif existing_place_club.present? && (@place_detail.type_of_place == existing_place_club.type_of_place)
                  @place_detail.update_columns(place_id: existing_place_club.id,  comment: params[:place][:comment])
                  average_price(existing_place_club)
                  compute_hearts(existing_place_club)



                  if user_signed_in?

                    @place = @place_detail.place
                    @place.update_columns(type_of_place: @place_detail.type_of_place)
                    @shared_place.place = @place
                    @shared_place.user = current_user
                    @shared_place.save
                    @place_detail.update_columns(user_id: current_user.id)

                    redirect_to place_path(@place)

                  else
                    redirect_to new_user_registration_app_path(@place_detail)
                  end

                else
                  @place.total_heart = 0
                  @place.type_of_place = @place_detail.type_of_place
                  if @place.save
                    @place_detail.update_columns(place_id: @place.id, comment: params[:place][:comment])
                    average_price(@place)
                    compute_hearts(@place)

                    if user_signed_in?

                      @place = @place_detail.place
                      @place.update_columns(type_of_place: @place_detail.type_of_place)
                      @shared_place.place = @place
                      @shared_place.user = current_user
                      @shared_place.save
                      @place_detail.update_columns(user_id: current_user.id)

                      redirect_to place_path(@place)

                    else
                      redirect_to new_user_registration_app_path(@place_detail)
                    end

                  else
                    render :new
                  end
                end

      end

    end
  end

  def new
    @place = Place.new
  end

  # def existing_place_yep(type_of_place)
  #   existing_places = Place.where(name: params[:place][:name]).all
  #   existing_places.each do |place|
  #     existing_place_"#{type_of_place}" = Place.find_by(name: params[:place][:name], type_of_place: "#{type_of_place}")
  #   end
  # end


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
    place.total_heart = place.details.count
    place.update_attribute(:total_heart, place.total_heart)
  end

  def place_params
    params.require(:place).permit(
      :photo_cache, :type_of_place, :photo, :google_place_id, :name, :address, :periods, :comment, :price, :website, :phone_number, :photo_google, :average_price, :total_heart
    )
  end

  def set_place
    @place = Place.find(params[:id])
  end

  def find_place_detail
    @place_detail ||= Detail.find(params[:detail_id])
  end
end
