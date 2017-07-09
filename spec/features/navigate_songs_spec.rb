require 'rails_helper'

describe "Navigating songs" do
  let(:artist) { create :artist }
  let!(:song) { create :song , artist: artist }

  it "allows navigation from the detail page to the home page" do
    visit song_url(song)

    click_link "All Songs"

    expect(current_path).to eq(root_path)
  end

  it "allows navigation from the home page to the detail page" do
    visit songs_url

    click_link song.name

    expect(root_path).to eq(root_path(song))
  end

end
