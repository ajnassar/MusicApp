class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def create

  end

  def new

    render :new
  end
end
