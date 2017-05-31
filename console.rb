require 'pry-byebug'
require_relative 'models/artists'
require_relative 'models/albums'

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Phantogram'
  })

artist2 = Artist.new({
  'name' => 'Justice'
  })

artist1.save()
artist2.save()

album1 = Album.new({
  'title' => 'Three',
  'genre' => 'Electro Rock',
  'artist_id' => artist1.id
  })

album2 = Album.new({
  'title' => 'Cross',
  'genre' => 'Electonic',
  'artist_id' => artist2.id
  })

album3 = Album.new({
  'title' => 'Woman',
  'genre' => 'Electonic',
  'artist_id' => artist2.id
  })

album1.save()
album2.save()
album3.save()

binding.pry
nil