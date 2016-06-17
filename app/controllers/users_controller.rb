class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def show
  end

  def new
  end

  def user_login
    @user = User.find_by(email:params[:login][:email].downcase)
    respond_to do |format|
      if @user && params[:login][:password] == @user.password
        session[:user] = @user.id
        format.html { redirect_to "/sessions"}
        format.json { render :show, status: :created, location: "/sessions"}
      else
        format.html { redirect_to '/',   notice: 'Your email and/or password were incorrect. Try again.'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user] = @user.id
        format.html { redirect_to "/sessions", notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: "/sessions"}
      else
        format.html { redirect_to '/', notice: @user.errors.full_messages}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
