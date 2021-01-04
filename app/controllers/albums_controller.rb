class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    unless @album.save
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
    # @stamp = Stamp.find(params[:album_id])
    @stamp = Stamp.find_by(album_id: @album.id)
    @stamps = @album.stamps
    # @albums = @stamps.album_id
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to action: :index
  end

  def search
    return nil if params[:keyword] == ""
    key = Stamp.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: key }
  end

  private

  def album_params
    params.require(:album).permit(:image, :category)
  end

end
