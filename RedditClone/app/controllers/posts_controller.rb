class PostsController < ApplicationController

  def new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user == current_user
    if @post.save!
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render :edit
    else
      flash.now[:errors] = ["Cannot edit another user's post"]
      render :show
    end
  end

  def update


  end

  def delete


  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end


end
