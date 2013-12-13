class UsersController < ApplicationController
  def create
    redirect_to :new

  end

  def new
    p "askdjkasjdkjsak"
    p params
    render :new
  end

end
