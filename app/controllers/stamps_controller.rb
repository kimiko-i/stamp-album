class StampsController < ApplicationController
  before_action :find_album, except: [:index, :search]
  # before_action :search_stamp, only: [:index, :search]

  def new
    @stamp = Stamp.new
  end

  def create
    @stamp = Stamp.new(stamp_params)
    if @stamp.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def index
    @stamps = Stamp.order('visit_day DESC')
  end

  def show
    @stamp = @album.stamps.find(params[:id])
  end

  def edit
    @stamp = Stamp.find(params[:id])
  end

  def update
    @stamp = Stamp.find(params[:id])
    if @stamp.update(stamp_params)
      redirect_to album_path(@album)
    else
      render :edit
    end
  end

  def destroy
    @stamp = Stamp.find(params[:id])
    @stamp.destroy 
    redirect_to album_path(@album)
  end

  def search
    return nil if params[:keyword] == ""
    key = Stamp.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: key }
    # @search = Stamp.ransack(params[:q])
    # @stamps = @search.result
    # @stamps = Stamp.where(['name LIKE ?', "%#{params[:name]}%"])
    # @stamps = Stamp.where(name: params[:name]) 
    # @stamps = Stamp.search(params[:name])
    # @stamps = Stamp.search(name: params[:name])
    # @stamps = Stamp.find_by(name: params[keyword: :name])
    # @stamps = @p.result.indludes(:stamp)
  end

  private

  def stamp_params
    params.require(:stamp).permit(:name, :visit_day, :image).merge(album_id: params[:album_id]) 
  end

  def find_album
    @album = Album.find(params[:album_id])
  end

  # def search_stamp
  #   @p = Stamp.ransack(params[:q])
  # end
end
