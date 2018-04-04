class DetailsController < ApplicationController
  before_action :set_place

  def create
    @detail = Detail.new(detail_params)
    @detail.place = @place
    @detail.user = current_user
    @detail.save
    redirect_to static_path
  end

  def new
    @detail = Detail.new
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def detail_params
    params.require(:detail).permit(:content, :price)
  end
end
