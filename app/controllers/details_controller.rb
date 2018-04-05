class DetailsController < ApplicationController

  def create
    @detail = Detail.new(detail_params)
    @detail.place = Place.find(params[:place_id])
    @detail.user = current_user
    if @detail.save
      redirect_to static_path
    else
      render :new
    end
  end

  def new
    @place = Place.find(params[:place_id])
    @detail = Detail.new
  end

  private

  def detail_params
    params.require(:detail).permit(:season, :comment, :price)
  end
end
