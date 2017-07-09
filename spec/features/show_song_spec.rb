require 'rails_helper'

describe "Viewing an individual song" do
  let(:artist) { create :artist}
  let(:song) { create :song, artist: artist }

  it "shows the room's details" do
    visit song_url(song)

    expect(page).to have_text(song.name)
    expect(page).to have_text(song.audio_url)
    expect(page).to have_text(artist.name)



  end
end
