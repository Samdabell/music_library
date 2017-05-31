require 'pry-byebug'
require_relative 'models/pizza_order'
require_relative 'models/customer'

artist1 = ({
  'name' => 'Phantogram'
  })

artist2 = ({
  'name' => 'Justice'
  })

album1 = ({
  'title' => 'Three',
  'genre' => 'Electro Rock',
  'artist_id' => artist1.id
  })

album2 = ({
  'title' => 'Cross',
  'genre' => 'Electonic',
  'artist_id' => artist2.id
  })

album3 = ({
  'title' => 'Woman',
  'genre' => 'Electonic',
  'artist_id' => artist2.id
  })

binding.pry
nil