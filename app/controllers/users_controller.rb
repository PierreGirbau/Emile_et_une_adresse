class UsersController < ApplicationController
  def show
    @user = User.find(params[:current_user])
    @places = @user.places
  end
end
