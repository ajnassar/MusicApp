class SessionsController < ApplicationController
  def create
    @user = User.find_by_user_name(params[:user][:user_name])
    if @user
      login_in_user(@user)
      redirect_to bands_url
    else
      flash[:errors] = ["Incorrect username or password"]
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
