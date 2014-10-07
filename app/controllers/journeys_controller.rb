class JourneysController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @journeys = Journey.published
  end

  def show
    @journey = Journey.published.find(params[:id])
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
    @journey = current_user.journeys.find(params[:id])
  end

  def update
    @journey = current_user.journeys.find(params[:id])

    if @journey.update_attributes(journey_params)
			flash[:notice] = "Szczegóły wyprawy zostały zaktualizowane"
			redirect_to dashboard_path
		else
			flash.now[:error] = 'Prosimy o sprawdzenie poprawności formularza'
			render :action => "edit"
		end

  end

  def destroy
  end

  private

    def journey_params
      params.require(:journey).permit(:title, :short_description, :long_description, :location, :text_date, :date, :duration, :duration_comments, :cover)
    end

end
