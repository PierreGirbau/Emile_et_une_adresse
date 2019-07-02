class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing, :static, :notlogin]

  def home; end

  def static
  end

  def landing; end

  def notlogin; end
end
