class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing, :static]

  def home; end

  def static; end

  def landing; end
end
