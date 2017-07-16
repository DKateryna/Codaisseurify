require 'rails_helper'

feature 'Delete song', js: true do
  let!(:artist) { create :artist, name: 'some name', image: 'https://goo.gl/i0S0iv' }
  let!(:song) { create :song, name: 'song name', audio_url: 'https://goo.gl/i0S0iv', artist: artist }

  scenario 'delete song' do
    visit artist_path(artist)

    accept_confirm do
      sleep 1
      find('a', text: '[Delete song]').click
    end

    expect(page).not_to have_content('song name')
  end
end
