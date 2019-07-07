class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing, :static, :notlogin, :alreadylogin, :alreadyshared]

  def home; end

  def static
  end

  def landing; end

  def notlogin; end

  def alreadylogin; end

  def alreadyshared; end

  def toomanyshared; end
end
