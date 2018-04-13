class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @saved_places = current_user.saved_places
    @shared_places = current_user.shared_places
  end
end
