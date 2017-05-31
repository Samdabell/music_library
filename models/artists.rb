require 'pg'
require_relative '../db/sql_runner'

class Artist

  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING * ;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

end