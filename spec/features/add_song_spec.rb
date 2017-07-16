require 'rails_helper'

feature 'Add song', js: true do
  let!(:artist) { create :artist, name: 'some name', image: 'https://goo.gl/i0S0iv' }

  scenario 'add a new song' do
    puts artist_path(artist)
    visit artist_path(artist)

    fill_in 'song[name]', with: 'Hope'
    fill_in 'song[audio_url]', with: 'https://goo.gl/i0S0iv'

    click_button 'Add song'

    expect(page).to have_content('Hope')
  end
end
