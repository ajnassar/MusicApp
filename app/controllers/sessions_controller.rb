class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user
      login_in_user(@user)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << "Incorrect Email or Password"
      render :new
    end
  end

  def new
    render :new
  end

  def destroy
    logout
  end
end
