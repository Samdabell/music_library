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

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id} ;"
    result = SqlRunner.run(sql)
    albums = result.map { |album| Album.new(album) }
    return albums
  end

  def update()
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id} ;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map {|artist_hash| Artist.new(artist_hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = #{id} ;"
    result = SqlRunner.run(sql)
    artist_hash =  result.first()
    artist = Artist.new(artist_hash)
    return artist
  end

end