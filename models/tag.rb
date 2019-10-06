require_relative( '../db/sql_runner' )

class Tag

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  def save()
    sql = 'INSERT INTO tags
    (type)
    VALUES($1)
    RETURNING id'
    values = [@type]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

end
