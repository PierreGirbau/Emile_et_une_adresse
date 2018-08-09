class DetailsController < ApplicationController
  # before_action :find_place, only: [:create, :new]
  skip_before_action :authenticate_user!, only: [:new, :create]

  def create
    # raise
    @detail = Detail.new(detail_params)
    if @detail.save
      redirect_to new_detail_place_path(@detail)
    else
      render :new
    end
  end

  def new
    @detail = Detail.new
  end

  private

  def detail_params
    params.require(:detail).permit(
      :season, :comment, :price, :type_of_place
    )
  end
end
