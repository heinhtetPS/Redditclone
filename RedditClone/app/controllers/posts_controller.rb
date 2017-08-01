class PostsController < ApplicationController

  def new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    debugger
    if @post.save!
      redirect_to sub_url(@post.sub_ids.first)
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
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render :show
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    redirect_to sub_url(@post.sub_id)
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids:[])
  end


end
