class TracksController < ApplicationController
  before_action :ensure_signed_in
  helper_method :find_current_album

  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new(album_id: params[:album_id])
  end

  def create
    @track = Track.new(track_params)
    if @track
      @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      @track.save!
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :show
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to album_url(@track.album_id)
  end


  def find_current_album
    Album.find_by(id: params[:album_id])
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :kind, :lyrics, :name)
  end
end
