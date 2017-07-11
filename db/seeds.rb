Song.destroy_all
Artist.destroy_all

artist1 = Artist.create!(name: 'Yiruma', image_url: 'http://res.cloudinary.com/djzs167i3/image/upload/v1499596432/images_5_lin0b9.jpg')
artist2 = Artist.create!(name: 'Yann Tiersen', image_url: 'http://res.cloudinary.com/djzs167i3/image/upload/v1499596303/yann_tiersen_czz4r0.jpg')
artist3 = Artist.create!(name: 'Onuka', image_url: 'http://res.cloudinary.com/djzs167i3/image/upload/v1499596313/onuka_xmb7k7.jpg')

artist_count = Artist.all.length
puts "#{artist_count} artist were created."

Song.create!([
               { name: 'River Flows In You', audio_url: 'http://res.cloudinary.com/djzs167i3/video/upload/v1499550425/yurima_-_river_flows_in_you__zv.fm_pvlgfc.mp3', artist: artist1 },
               { name: 'Kiss The Rain', audio_url: 'http://res.cloudinary.com/djzs167i3/video/upload/v1499550412/yurima_-_kiss_the_rain__zf.fm_ujpvr0.mp3', artist: artist1 },
               { name: "Le Fabuleux Destin d'Amélie Poulain", audio_url: 'http://res.cloudinary.com/djzs167i3/video/upload/v1499550392/yann_tiersen_-_comptine_dun_autre_ete_lapres_midi_ost_ameli__le_fabuleux_destin_damlie_poulain__zv.fm_l8wics.mp3', artist: artist2 },
               { name: 'Time', audio_url: 'http://res.cloudinary.com/djzs167i3/video/upload/v1499589504/onuka_-_time__zvukoff.ru_ruid8g.mp3', artist: artist3 }
             ])

songs_count = Song.all.length
puts "#{songs_count} songs were created."
