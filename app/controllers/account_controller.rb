class AccountController < ApplicationController

  before_filter :authenticate_user!

  def index
    @journeys = current_user.journeys
  end

  def edit
    @user = current_user
  end

end
