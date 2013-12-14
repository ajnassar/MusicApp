class UsersController < ApplicationController
  def index
    render :json => User.all
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login_in_user(@user)
      redirect_to new_user_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end

end
