require 'rails_helper'

feature 'Navigating songs', js: true do
  let(:artist) { create :artist }
  let!(:song) { create :song, artist: artist }

  scenario 'navigate from all artists to one' do
    visit artists_path
    click_link artist.name

    expect(page).to have_text(artist.name)
    expect(page).to have_text('List of Songs')
    expect(current_path).to eq(artist_path(artist.id))
  end

  scenario 'navigation from the one_artist page to the song page' do
    visit artists_path
    visit artist_path(artist.id)
    click_link song.name

    expect(page).to have_text(artist.name)
    expect(page).to have_text('Song:', song.name)

    expect(current_path).to eq(artist_song_path(artist.id, song.id))
  end
end
