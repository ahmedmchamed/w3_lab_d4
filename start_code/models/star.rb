require_relative("../db/sql_runner")

class Star

    attr_reader :casting_id, :id
    attr_accessor :first_name, :last_name

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @casting_id = options['casting_id'].to_i
        @first_name = options['first_name']
        @last_name = options ['last_name']
    end

end
