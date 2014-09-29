class DashboardController < ApplicationController

  before_filter :authenticate_user!

  def index
    @journeys = current_user.journeys
  end

end
