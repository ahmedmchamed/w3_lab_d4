require_relative("../db/sql_runner")
require_relative('./star')
require_relative('./movie')

class Casting

    attr_reader :movie_id, :star_id, :id
    attr_accessor :fee

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @star_id = options['star_id'].to_i
        @movie_id = options['movie_id'].to_i
        @fee = options['fee'].to_i
    end

    def save()
        sql = "INSERT INTO castings
        (
            star_id,
            movie_id,
            fee
        )
        VALUES
        (
            $1, $2, $3
        )
        RETURNING id;"
        values = [@star_id, @movie_id, @fee]
        casting_hash = SqlRunner.run( sql, values ).first()
        @id = casting_hash['id'].to_i()
    end

    def movie()
        sql = "SELECT * FROM movies WHERE id = $1"
        values = [@movie_id]
        return Movie.map_data(SqlRunner.run(sql, values))
    end

    def star()
        sql = "SELECT * FROM stars WHERE id = $1"
        values = [@star_id]
        return Star.map_data(SqlRunner.run(sql, values))
    end

    def self.delete_all()
        sql = "DELETE FROM castings;"
        SqlRunner.run(sql)
    end

    def self.map_data(casting_hash)
        return casting_hash.map { |casting| Casting.new(casting) }
    end

end
