# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    password = 'mimile'
    return flash[:alert] = 'Email déjà utilisé !' if User.find_by(email: params[:user][:email])
    user = User.create!(email: params[:user][:email], first_name: params[:user][:first_name], password: password)
    associate_place_and_detail_to_user
    redirect_to static_path(place: @place)
  end

  def associate_place_and_detail_to_user
    @place_detail = Detail.find(params[:user][:detail_id])
    @place = @place_detail.place
    @place.update_columns(type_of_place: @place_detail.type_of_place)
    @shared_place = SharedPlace.new
    @shared_place.place = @place
    @shared_place.user = User.find_by(email: params[:user][:email])
    @shared_place.save
    @place_detail.update_columns(user_id: User.find_by(email: params[:user][:email]).id)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   static_path(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
