require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "validations" do
    it "is invalid without name" do
      song = Song.new
      song.valid?
      expect(song.errors).to have_key(:name)
    end
  end

  describe ".order_by_name" do
    let(:artist) { create :artist}
    let!(:song1) { create :song, name: "Litak", artist: artist}
    let!(:song2) { create :song, name: "Zozulja", artist: artist }
    let!(:song3) { create :song, name: "Allo", artist: artist }

    it "returns a sorted array of songs by names" do
      expect(Song.order_by_name).to eq([song3, song1, song2])
    end
  end


  describe "association with artist" do
    let(:artist) { create :artist }

    it "belongs to a artist" do
      song = artist.songs.new(name: "Time")

      expect(song.artist).to eq(artist)
    end
  end

end
