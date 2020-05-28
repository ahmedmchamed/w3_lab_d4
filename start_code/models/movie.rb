require_relative('../db/sql_runner')

class Movie

    attr_reader :casting_id, :id
    attr_accessor :title, :genre

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @title = options['title']
        @genre = options['genre']
        @casting_id = options['casting_id'].to_i()
    end

end
