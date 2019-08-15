require_relative('../db/sql_runner')

class Movie
  attr_accessor(:title, :genre)
  attr_reader(:id)

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO movies (title, genre)
    VALUES ($1, $2)
    RETURNING id;"
    values = [@title, @genre]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * from movies;"
    result = SqlRunner.run(sql)
    result.map { |movie| Movie.new(movie) }
  end

  def update
    sql = "UPDATE movies SET (title, genre) = ($1, $2)
    WHERE id = $3;"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM movies
    WHERE id = $1
    RETURNING title;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    result = "The movie '#{result[0]['title']}' and all associated records have been deleted."
  end

  def stars
    sql = "SELECT stars.* FROM stars
    INNER JOIN castings on castings.star_id = stars.id
    WHERE movie_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    result.map { |star| Star.new(star) }
  end

end
