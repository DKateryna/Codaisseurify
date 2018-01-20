class SongsController < ApplicationController
  
  def show
    artist = Artist.find(params[:artist_id])
    @song = artist.songs.find(params[:id])
  end

  def new
    artist = Artist.find(params[:artist_id])
    @song = Song.new
    @song.artist = artist
  end

  def create
    @song = Song.new(song_params)
    @song.artist = Artist.find(params[:artist_id])
    if @song.save!
      redirect_to @song.artist
    else
      render 'new'
    end
  end

  def edit
    artist = Artist.find(params[:artist_id])
    @song = artist.songs.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    if @song.update_attributes(song_params)
      redirect_to @song.artist
    else
      render 'edit'
    end
  end

  def destroy
    @song = Song.find(params[:id])
    artist = @song.artist
    @song.destroy

    redirect_to artist
  end

  private

  def song_params
    params.require(:song).permit(:name, :audio_url, :artist_id)
  end
end
