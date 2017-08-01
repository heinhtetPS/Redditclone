class PostsController < ApplicationController

  def new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id


  end

  def show

  end

  def edit

  end

  def update


  end

  def delete


  end 

  private

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end


end
