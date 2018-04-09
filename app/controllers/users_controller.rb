class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @saved_places = current_user.saved_places
    @shared_places = current_user.shared_places

    # pour avoir les shared places, faire un : @shared_places = SharedPlace.where(visible method = true)
  end

  def portfolio

  end
end
