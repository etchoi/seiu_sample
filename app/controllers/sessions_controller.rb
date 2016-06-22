class SessionsController < ApplicationController
  def index
    @user = User.find_by(id:session[:user])
    @my_blog = Blog.joins(:user).where(user_id:session[:user])
    # @blogs = Blog.all
    if params[:search]
      @blogs = Blog.joins(:user).search(params[:search]).where.not(user_id:session[:user]).order("created_at DESC")
    else
      @blogs = Blog.joins(:user).all.where.not(user_id:session[:user])
    end
  end

  def show
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
    flash[:search_result] = nil
    redirect_to sessions_path
  end

  def destroy
    session[:user] = nil
    redirect_to '/users'
  end
end
