class PagesController < ApplicationController
  def index
  end

  def profile
    if(User.find_by_username(params[:id]))
   @username = params[:id]
   else
      redirect_to root_path, :notice=> "user not found!"
    end
    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]) )
    @newPost = Post.new
    
    @toFollow = User.all.last(5)
  end

  def explore
    @posts = Post.all
    @newPost = Post.new
        @toFollow = User.all.last(5)
  end

  def home
    @posts = Post.all
    @newPost = Post.new
  end
end
