require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_length_of(:image_url).is_at_most(255) }
  end

  describe '.order_by_name' do
    let!(:artist1) { create :artist, name: 'L' }
    let!(:artist2) { create :artist, name: 'Z' }
    let!(:artist3) { create :artist, name: 'B' }
    it 'returns a sorted array of artists by names' do
      expect(Artist.order_by_name).to eq([artist3, artist1, artist2])
    end
  end

  describe 'association with song' do
    let!(:artist) { create :artist }
    let!(:song) { create :song, artist: artist }
    it 'has many songs' do
      song1 = artist.songs.new(name: 'Time')
      song2 = artist.songs.new(name: 'Trymaj')
      expect(artist.songs).to include(song1)
      expect(artist.songs).to include(song2)
    end
    it 'deletes associated songs' do
      expect { delete :destroy, id: song.id, artist_id: @artist.id }
    end
  end
end
