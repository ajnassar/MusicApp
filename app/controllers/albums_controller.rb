class AlbumsController < ApplicationController

  def new

    @album = Album.new
    render :new
  end

  def create
    @band = Band.find_by_name(params[:band])
    @album = Album.new(params[:album])
    if @album.save
      redirect_to band_url(@album.band)
    else
      flash.now[:errors] = @album.errors.full_messages
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy

  end

  def edit

  end

  def update

  end
end
