class Casting
  attr_reader(:movie_id, :star_id)
  attr_accessor(:fee)

  def initialize(options)
    @fee = options['fee']
    @movie_id = options['movie_id']
    @star_id = options['star_id']
    @id = options['id'] if options['id']
  end

  def save
    sql = "INSERT INTO castings (fee, movie_id, star_id)
    VALUES ($1, $2, $3)
    RETURNING id;"
    values = [@fee, @movie_id, @star_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = " SELECT *"
  end


end
