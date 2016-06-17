class SessionsController < ApplicationController
  def index
    @user = User.find_by(id:session[:user])
    @my_blog = Blog.joins(:user).where(user_id:session[:user])
    @all_blog = Blog.where.not(user_id:session[:user])
    @blogs = Blog.all
    if params[:search]
      @blogs = Blog.joins(:user).search(params[:search]).order("created_at DESC")
    else
      @blogs = Blog.all.order('created_at DESC')
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
  end

  def destroy
  end
end
