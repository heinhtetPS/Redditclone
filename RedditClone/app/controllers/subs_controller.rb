class SubsController < ApplicationController

  def new
    render :new
  end

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
  end


  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user
    if @sub.save!
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end


  def edit
    @sub = Sub.find(params[:id])
    if @sub.moderator == current_user
      render :edit
    else
      flash.now[:errors] = ["You cannot edit a sub unless you're a moderator"]
      render :index
    end
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.save!
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      redirect_to edit_sub_url
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end


end
