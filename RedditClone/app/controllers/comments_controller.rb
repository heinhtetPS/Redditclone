class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

  end


  def edit
    @comment = Comment.find(params[:id])
    if @comment.author_id == current_user.id

    else
      flash.now[:errors]
    end
  end

  def update
    @comment = Comment.find(params[:id])

  end


  def destroy
    @comment = Comment.find(params[:id])

  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id)
  end


end
