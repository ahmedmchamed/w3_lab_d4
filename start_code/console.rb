require('pry-byebug')
require_relative('models/star')
require_relative('models/movie')
require_relative('models/casting')


star1 = Star.new({
    "first_name" => "Jeff",
    "last_name" => "Goldblum"
})

movie1 = Movie.new({ 
    "title" => "Jurassic Park",
    "genre" => "Thriller"
})

star1.save()
movie1.save()

binding.pry

nil