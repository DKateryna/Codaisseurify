class Api::SongsController < ApplicationController
  def index
    render status: 200, json: {
      songs: Artist.find(params[:artist_id]).songs
    }.to_json
  end
end
