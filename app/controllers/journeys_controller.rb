class JourneysController < ApplicationController
  before_filter :authenticate_user!

  def index
    @journeys = Journey.published
  end

  def show
  end

  def new
    @journey = Journey.new
  end

  def create
    @journey = Journey.new  journey_params
    @journey.user = current_user
    if @journey.save
      flash[:notice] = "Wyprawa została zapisana!"
      redirect_to root_path
    else
      flash.now[:error] = "Sprawdź poprawność pól formularza i spróbuj ponownie"
      render action: "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def journey_params
      params.require(:journey).permit(:title, :short_description, :long_description, :location, :text_date, :date, :duration, :duration_comments)
    end

end
