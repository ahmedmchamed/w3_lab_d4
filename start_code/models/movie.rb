require_relative('../db/sql_runner')
require_relative('./star')
require_relative('./casting')

class Movie

    attr_reader :id
    attr_accessor :title, :genre

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @title = options['title']
        @genre = options['genre']
        @budget = options['budget'].to_i()
    end

    def save()
        sql ="INSERT INTO movies
        (title, genre, budget)
        VALUES
        ($1, $2, $3)
        RETURNING id"
        values = [@title, @genre, @budget]
        movie = SqlRunner.run(sql, values).first
        @id = movie['id'].to_i
    end

    def update()
        sql = "UPDATE movies SET
        (title, genre, budget) = ($1, $2, $3)
        WHERE id = $4"
        values = [@title, @genre, @budget, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM movies WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def stars()
        sql = "SELECT stars.* FROM stars
        INNER JOIN castings ON 
        castings.star_id = stars.id 
        WHERE movie_id = $1;"
        values = [@id]
        stars_array_of_hashes = SqlRunner.run(sql, values)
        return Star.map_data(stars_array_of_hashes)
    end

    def casting()
        sql = "SELECT * FROM castings WHERE movie_id = $1"
        values = [@id]
        return Casting.map_data(SqlRunner.run(sql, values))
    end

    def remaining_budget()
        sql = "SELECT castings.fee FROM castings WHERE id = $1"
        values = [@id]
        fee_value = SqlRunner.run(sql, values)[0]['fee'].to_i()
        return @budget - fee_value
    end

    def self.all()
        sql = "SELECT * FROM movies"
        movies_array_of_hashes = SqlRunner.run(sql)
        return self.map_data(movies_array_of_hashes)
    end

    def self.delete_all()
        sql = "DELETE FROM movies"
        SqlRunner.run(sql)
    end

    def self.map_data(movies_hash)
        return movies_hash.map { |movie| Movie.new(movie) }
    end
end
