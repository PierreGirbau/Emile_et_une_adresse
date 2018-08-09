class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @saved_places = current_user.saved_places
    @shared_places = current_user.shared_places
  end
end
