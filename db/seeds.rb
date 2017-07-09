Song.delete_all
Artist.delete_all

artist1 = Artist.create!({name: "Yiruma", image_url: "https://i.ytimg.com/vi/GgRICIbNxUI/hqdefault.jpg"})
artist2 = Artist.create!({name: "Yann Tiersen", image_url: "http://www.amalgama-lab.com/pict/bands/songs/y/yann_tiersen.jpg"})
artist3 = Artist.create!({name: "Onuka", image_url: "https://images.shazam.com/coverart/t308972518-b1075955747_s400.jpg"})

artist_count = Artist.all.length
puts "#{artist_count} artist were created."

Song.create!([
  { name: "River Flows In You", video_url: "https://youtu.be/VslLZcV9ZcU", artist: artist1 },
  { name: "Kiss The Rain", video_url: "https://youtu.be/VslLZcV9ZcU", artist: artist1  },
  { name: "Le Fabuleux Destin d'Amélie Poulain", video_url: "https://youtu.be/7wCLK9iOPDw", artist: artist2  },
  { name: "Time", video_url: "https://youtu.be/_4Cswp7smQ0", artist: artist3}
])

songs_count = Song.all.length
puts "#{songs_count} songs were created."
