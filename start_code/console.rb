require('pry')
require_relative('models/casting')
require_relative('models/star')
require_relative('models/movie')

movie1 = Movie.new('title' => 'Top Gun', 'genre' => 'Awesomeness')
movie2 = Movie.new('title' => 'Ocean\'s Eleven', 'genre' => 'Crime')
movie3 = Movie.new('title' => 'Frozen', 'genre' => 'Rubbish')

movie1.save
movie2.save
movie3.save

star1 = Star.new('first_name' => 'Graham', 'last_name' => 'Superstar')
star2 = Star.new('first_name' => 'Karolina', 'last_name' => 'Oscarwinner')
star3 = Star.new('first_name' => 'Bob', 'last_name' => 'The-Builder')

star1.save
star2.save
star3.save

casting1 = Casting.new('fee' => 1_000_000, 'movie_id' => 1, 'star_id' => 1)
casting2 = Casting.new('fee' => 1_000_001, 'movie_id' => 2, 'star_id' => 2)
casting3 = Casting.new('fee' => 10_000_000, 'movie_id' => 3, 'star_id' => 3)


casting1.save
casting2.save
casting3.save

binding.pry
nil
