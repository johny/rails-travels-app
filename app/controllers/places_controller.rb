class PlacesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new  place_params
    if @place.save
      flash[:notice] = "Miejsce zostało zapisane!"
      redirect_to places_path
    else
      flash.now[:error] = "Sprawdź poprawność pól formularza i spróbuj ponownie"
      render action: "new"
    end
  end

  def edit
    @place = Places.find(params[:id])
  end

  def update
    @place = Places.find(params[:id])

    if @place.update_attributes(place_params)
      flash[:notice] = "Szczegóły miejsca zostały zaktualizowane"
      redirect_to dashboard_path
    else
      flash.now[:error] = 'Prosimy o sprawdzenie poprawności formularza'
      render :action => "edit"
    end

  end

  def destroy
  end

  private

  def place_params
    params.require(:place).permit(:title, :short_description, :long_description, :cover, :latitude, :longitude)
  end

end
