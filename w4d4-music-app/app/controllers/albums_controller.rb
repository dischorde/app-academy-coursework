class AlbumsController < ApplicationController
  before_action :ensure_signed_in

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new(band_id: params[:band_id])
  end

  def create
    @album = Album.new(album_params)
    if @album
      @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to band_url(@album.band_id)
  end

  private

  def album_params
    params.require(:album).permit(:band_id, :kind, :name)
  end
end
