class BlogsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @new_blog = Blog.new(content:params[:blog][:content], title:params[:blog][:title], user_id:params[:blog][:user])
    respond_to do |format|
      if @new_blog.save
        format.html { redirect_to "/sessions", notice: 'Your blog was successfully saved.' }
        format.json { render :show, status: :created, location: "/sessions"}
      else
        format.html { redirect_to '/', notice: @new_blog.errors.full_messages}
        format.json { render json: @new_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
