class Star
  attr_accessor(:first_name, :last_name)
  attr_reader(:id)

  def initialize(options)
    @first_name = options['first_name']
    @last_name =  options['last_name']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO stars (first_name, last_name)
    VALUES ($1, $2)
    RETURNING id;"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM stars;"
    result = SqlRunner.run(sql)
    result.map {|star| Star.new(star)}
  end

  def update
    sql = "UPDATE stars SET (first_name, last_name) = ($1, $2)
    WHERE id = $3;"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM stars
    WHERE id = $1
    RETURNING *;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    result = "The star '#{result[0]['first_name']} #{result[0]['last_name']}' and all associated records have been deleted."
  end

  def movies
    sql = "SELECT movies.* FROM movies
    INNER JOIN castings ON castings.movie_id = movies.id
    WHERE star_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    result.map { |movie| Movie.new(movie) }
  end

end
