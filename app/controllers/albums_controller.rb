class AlbumsController < ApplicationController
  def index
    @albums = Album.page(params[:page]).per(10)
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos
    respond_to do |format|
      format.html
      format.json { render json: { album: @album, photos: @photos } }
    end
  end
end
