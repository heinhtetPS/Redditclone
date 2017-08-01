class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
    )
    if @user
      login(@user)
      #redirect to links
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end


  def destroy
    logout
    redirect_to session_url
  end

end
