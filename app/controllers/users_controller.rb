class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


  def update
    @user = current_user

    if @user.update_attributes(user_params)
      flash[:notice] = "Twój profil został zaktualizowany"
      redirect_to dashboard_path
    else
      flash.now[:error] = 'Prosimy o sprawdzenie poprawności formularza'
      render controller: "account", action: "edit"
    end

  end


  private

    def user_params

      params.require(:user).permit(:name, :email, :description, :avatar)

    end

end
