class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.active
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new  post_params
    @post.user = current_user
    @post.expires_at = (Date.today + 7.days).midnight
    if @post.save
      flash[:notice] = "Ogłoszenie zostało zapisane!"
      redirect_to posts_path
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

    def post_params
      params.require(:post).permit(:title, :content, :expires_at)
    end

end
