class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      login_in_user(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

end
