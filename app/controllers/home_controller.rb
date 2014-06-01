class HomeController < ApplicationController

  def index
  end

  def signup
    if request.post?
      @user = User.new(user_params)
      @user.password = Devise.friendly_token.first(8)
      if @user.valid?
        @user.save
        flash[:notice] = "Dzięki!"
        redirect_to action: 'index'
      else
        flash[:error] = "Sprawdź poprawnośc danych i spróbuj ponownie!"
        render layout: 'landing'
      end
    else
      @user = User.new
      render layout: 'landing'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :description, :email)
    end
end
