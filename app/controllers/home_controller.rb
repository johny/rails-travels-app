class HomeController < ApplicationController

  def index
  end

  def signup
    if request.post?
      @user = User.new(user_params)
      if @user.valid?
        @user.save
        flash[:notice] = "Dzięki!"
        redirect_to dashboard_path
      else
        flash.now[:error] = "Sprawdź poprawnośc danych i spróbuj ponownie!"
      end
    else
      @user = User.new
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :description, :password, :email)
    end
end
