class DetailsController < ApplicationController
  before_action :find_place, only: [:create, :new]

  def create
    @detail = Detail.new(detail_params)
    @detail.place = @place
    @detail.user = current_user
    if @detail.save
      average_price
      compute_hearts
      redirect_to static_path
    else
      render :new
    end
  end

  def new
    @detail = Detail.new
  end

  private

  def average_price
    average_price = 0
    @place.details.each do |detail|
      average_price += detail.price
    end
    @place.average_price = ( average_price / (@place.details.count) ).to_i
    @place.update_attribute(:average_price, @place.average_price)
  end

  def compute_hearts
    @place.total_heart += @place.total_heart
    @place.update_attribute(:total_heart, @place.total_heart)
  end

  def detail_params
    params.require(:detail).permit(:season, :comment, :price)
  end

  def find_place
    @place = Place.find(params[:place_id])
  end
end
