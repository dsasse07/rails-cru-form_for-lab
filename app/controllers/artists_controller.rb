class ArtistsController < ApplicationController
  before_action :set_artist, only: [:edit, :update, :show]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
    @message = "Create Artist"
  end

  def create
    @artist = Artist.create(artist_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  def show
    
  end

  def edit
    @message = "Update Artist"
  end

  def update
    @artist.update(artist_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  private

  def artist_params(*args)
    params.require(:artist).permit(*args)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
