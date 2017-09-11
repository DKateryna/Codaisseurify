require 'rails_helper'

describe 'Navigating songs' do
  let(:artist) { create :artist }
  let!(:song) { create :song, artist: artist }

  it 'navigate from all artists to one' do
    visit artists_url
    click_link artist.name

    expect(page).to have_text(artist.name)
    expect(page).to have_text('List of Songs')
    expect(current_path).to eq(artist_path(artist.id))
  end

  it 'navigation from the one_artist page to the song page' do
    visit artist_songs_url(artist.id)

    click_link song.name

    expect(page).to have_text(artist.name)
    expect(page).to have_text('Song:', song.name)
    expect(page).to have_text('[All Songs]')

    expect(current_path).to eq(artist_song_path(artist.id, song.id))
  end
end
