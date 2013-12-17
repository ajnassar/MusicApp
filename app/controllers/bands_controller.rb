class BandsController < ApplicationController
  before_filter :authenticate

  def index
    @bands = Band.all
  end

  def create
    @band = Band.new()
  end

  def new

    render :new
  end
end
