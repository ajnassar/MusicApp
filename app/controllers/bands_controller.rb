class BandsController < ApplicationController
  before_filter :authenticate

  def index
    @bands = Band.all
  end

  def create
    @band = Band.new(params[:band])
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def show
    @band = Band.find(params[:id])
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(params[:band])
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end
end
