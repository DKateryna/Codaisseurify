class Api::SongsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render status: 200, json: {
      songs: Artist.find(params[:artist_id]).songs
    }.to_json
  end

  def show
    render status: 200, json: {
      song: Artist.find(params[:artist_id]).songs.find(params[:id])
    }.to_json
  end

  def create
    song = Song.new(song_params)

    if song.save
      render status: 201, json: {
        message: 'Song created',
        song: Artist.find(params[:artist_id]).songs.find(song.id)
      }.to_json
    else
      render status: 422, json: {
        errors: song.errors
      }.to_json
    end
  end

  private

  def song_params
    params.require(:song).permit(:name, :audio_url, :artist_id)
  end
end
