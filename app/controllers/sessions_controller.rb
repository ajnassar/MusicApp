class SessionsController < ApplicationController
  def create
    @user = User.find_by_user_name(params[:user][:user_name])
    if !@user.nil?
      login_in_user(@user)
      @user.save
      redirect_to users_url
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
  end
end
