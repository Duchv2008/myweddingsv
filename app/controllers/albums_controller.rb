class AlbumsController < ApplicationController
  before_action :authenticate_request!
  before_action :find_wedding
  before_action :find_album, except: [:create, :index]

  def index
    @albums = @wedding.albums
    render json: {results: @albums}
  end

  def create
    @album = @wedding.albums.new parameter

    if @album.save
      render json: @album, status: 200
    else
      render json: { errors: @album.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def show
    render json: @album, status: 200
  end

  def update
    if @album.update parameter
      render json: @album, status: 200
    else
      render json: { errors: @album.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def destroy
    if @album.destroy
      render json: @album, status: 200
    else
      render json: { errors: @album.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  private

  def parameter
    params.permit :title, :desc
  end

  def find_wedding
    @wedding = Wedding.find params[:wedding_id]
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Wedding not found' }, status: 404
  end

  def find_album
    @album = Album.find params[:id]
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Album not found' }, status: 404
  end
end
