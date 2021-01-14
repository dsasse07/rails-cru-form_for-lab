class SongsController < ApplicationController

  before_action :set_song, only: [:edit, :update, :show]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    @message = "Create Song"
  end

  def create
    @song = Song.create(song_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  def show
    
  end

  def edit
    @message = "Update Song"
  end

  def update
    @song.update(song_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
