class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user
      login_in_user(@user)
      redirect_to bands_url
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to bands_url
    end
  end

  def new
    render :new
  end

end
