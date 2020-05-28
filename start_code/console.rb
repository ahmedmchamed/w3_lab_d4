require('pry-byebug')
require_relative('models/star')
require_relative('models/movie')
require_relative('models/casting')

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

star1 = Star.new({
    "first_name" => "Jeff",
    "last_name" => "Goldblum"
})

star1.save()

movie1 = Movie.new({ 
    "title" => "Jurassic Park",
    "genre" => "Thriller",
    "budget" => 50000000
})

movie1.save()

casting1 = Casting.new({
    "star_id" => star1.id,
    "movie_id" => movie1.id,
    "fee" => 10000000
})

casting1.save()


binding.pry

nil