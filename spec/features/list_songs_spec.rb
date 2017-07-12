require 'rails_helper'

describe 'Current artist has the list of songs' do
  let(:artist) { create :artist, image_url: 'https://goo.gl/i0S0iv' }

  let!(:song) { create :song, artist: artist }

  it 'shows all his songs' do
    visit artist_songs_url(artist.id)

    expect(page).to have_text('Songs')
  end

  it 'does not show other artists songs' do
    visit artist_songs_url(artist.id)

    expect(page).not_to have_text('Another artist song')
  end
end
