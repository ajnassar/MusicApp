class BandsController < ApplicationController
  before_filter :require_loggin!

  def index
    @bands = Band.all
  end

  def create

  end

  def new

    render :new
  end
end
