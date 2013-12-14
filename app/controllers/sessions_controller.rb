class SessionsController < ApplicationController
  def create
    password = params[:user][]
    #Work on find_by_credentials, this method is in User model
    @user = User.find_by_credentials(params[:user][:email], params[:user])
    if @user
      login_in_user(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = ["Incorrect username or password"]
      render :new
    end
  end

  def new
    render :new
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
